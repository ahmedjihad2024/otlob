import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:otlob/core/network/base_response.dart';

import 'failure.dart';

Future<Either<Failure, R2>> fastHandler<R, R2>({
  required Future<R> Function() request,
  required R2 Function(R response) mapper,
}) async {
  try {
    final response = await request();
    if (response is BasicResponse && !response.success) {
      return Left(ServerError(message: response.message));
    }
    return Right(mapper(response));
  } catch (e) {
    return Left(e.handle);
  }
}

extension ErrorHandler on Object {
  Failure get handle => switch (this) {
    final DioException e => _handleDioException(e),
    _ => UnexpectedError(message: toString()),
  };
}

Failure _handleDioException(DioException e) => switch (e.type) {
  DioExceptionType.connectionError => NoInternetConnection(),
  DioExceptionType.badResponse => _handleBadResponse(e.response),
  DioExceptionType.connectionTimeout ||
  DioExceptionType.sendTimeout ||
  DioExceptionType.receiveTimeout => ServerError(
    message: 'Connection timed out. Please try again.',
  ),
  DioExceptionType.cancel => ServerError(message: 'Request was cancelled.'),
  DioExceptionType.badCertificate => ServerError(
    message: 'Invalid certificate from the server.',
  ),
  _ => ServerError(message: 'Something went wrong. Please try again.'),
};

Failure _handleBadResponse(Response? response) {
  final message = _extractMessage(response?.data);
  if (message != null) return ServerError(message: message);

  final status = response?.statusCode;
  return ServerError(
    message: switch (status) {
      400 => 'Invalid data provided.',
      401 => 'Please login again.',
      403 => "You don't have access.",
      404 => 'The requested resource does not exist.',
      429 => 'Too many requests. Please try again later.',
      != null && >= 500 => 'Something went wrong on our end.',
      _ => 'An unknown error occurred.',
    },
  );
}

/// Keys the backend may use to send the error message (by priority).
/// Add or remove keys to match your backend.
const _messageKeys = ['message', 'error', 'detail', 'title'];

/// Finds the error message in any response shape:
/// - "text"
/// - {"message": "text"}
/// - {"message": ["a", "b"]}   (validation errors)
/// - {"error": {"message": "text"}}   (nested)
String? _extractMessage(dynamic data) {
  if (data is String) {
    final text = data.trim();
    // ignore empty text and HTML pages (e.g. 502 from a proxy)
    return text.isEmpty || text.startsWith('<') ? null : text;
  }
  if (data is List) {
    final parts = data.map(_extractMessage).whereType<String>();
    return parts.isEmpty ? null : parts.join('\n');
  }
  if (data is Map) {
    for (final key in _messageKeys) {
      final message = _extractMessage(data[key]);
      if (message != null) return message;
    }
  }
  return null;
}
