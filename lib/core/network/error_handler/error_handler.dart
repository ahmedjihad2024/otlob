import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:otlob/core/network/base_response.dart';

import 'failure.dart';

Future<Either<Failure, T>> fastHandler<R, T>({
  required Future<R> Function() request,
  required T Function(R response) mapper,
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
  DioExceptionType.badResponse => _handleBadResponse(e.response),
  DioExceptionType.connectionError => NoInternetConnection(),
  DioExceptionType.connectionTimeout => CustomDioLocalError(
    error: LocalErrorType.CONNECTION_TIMEOUT,
  ),
  DioExceptionType.sendTimeout => CustomDioLocalError(
    error: LocalErrorType.SEND_TIMEOUT,
  ),
  DioExceptionType.receiveTimeout => CustomDioLocalError(
    error: LocalErrorType.RECEIVE_TIMEOUT,
  ),
  DioExceptionType.transformTimeout => CustomDioLocalError(
    error: LocalErrorType.TRANSFORM_TIMEOUT,
  ),
  DioExceptionType.cancel => CustomDioLocalError(error: LocalErrorType.CANCEL),
  DioExceptionType.badCertificate => CustomDioLocalError(
    error: LocalErrorType.BAD_CERTIFICATION,
  ),
  DioExceptionType.unknown => CustomDioLocalError(
    error: LocalErrorType.UNKNOWN,
  ),
};

Failure _handleBadResponse(Response? response) {
  final status = response?.statusCode;

  final message = _extractMessage(response?.data);
  if (message == null) {
    return ServerError(message: 'An unknown error occurred.');
  }

  final apiError = ApiErrorType.from(status, message);
  return apiError != null
      ? CustomServerError(error: apiError)
      : ServerError(message: message);
}

/// Keys the backend may use to send the error message (by priority).
const _messageKeys = ['message', 'error', 'detail', 'title'];

/// Finds the error message in any response shape:
/// - "text"
/// - {"message": "text"}
/// - {"message": ["a", "b"]}
/// - {"error": {"message": "text"}}
/// - {"title": "...", "errors": {"Email": ["..."]}}  (validation errors)
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
    // field validation errors first: they're more specific than "title"
    final errors = data['errors'];
    if (errors is Map) {
      final message = _extractMessage(errors.values.toList());
      if (message != null) return message;
    }
    for (final key in _messageKeys) {
      final message = _extractMessage(data[key]);
      if (message != null) return message;
    }
  }
  return null;
}

enum LocalErrorType {
  CONNECTION_TIMEOUT('Connection to the server timed out.'),
  SEND_TIMEOUT('Request timed out while sending.'),
  RECEIVE_TIMEOUT('Response timed out while receiving.'),
  TRANSFORM_TIMEOUT('Response processing timed out.'),
  CANCEL('Request was cancelled.'),
  BAD_CERTIFICATION('Invalid certificate from the server.'),
  UNKNOWN('Something went wrong. Please try again.');

  final String message;
  const LocalErrorType(this.message);
}

enum ApiErrorType {
  USER_NOT_CONFIRMED(401, 'User is not confirmed.'),
  UNAUTHORIZED(401, 'غير مصرح'),
  EMAIL_TAKEN(400, 'An account with the given email already exists.'),
  INCORRECT_CREDENTIALS(401, 'Incorrect username or password.'),
  INVALID_CODE(400, 'Invalid code provided, please request a code again.'),
  INVALID_REFRESH_TOKEN(400, 'Invalid Refresh Token');

  final int statusCode;
  final String message;
  const ApiErrorType(this.statusCode, this.message);

  static ApiErrorType? from(int? statusCode, String message) {
    for (final e in values) {
      if (e.statusCode == statusCode &&
          e.message.toLowerCase() == message.toLowerCase()) {
        return e;
      }
    }
    return null;
  }
}
