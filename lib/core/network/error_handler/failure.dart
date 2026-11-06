import 'package:otlob/core/network/error_handler/error_handler.dart';

sealed class Failure {
  const Failure();
}

class ServerError extends Failure {
  final String? message;
  const ServerError({this.message});
}

class UnexpectedError extends Failure {
  final String? message;
  const UnexpectedError({this.message});
}

class NoInternetConnection extends Failure {
  const NoInternetConnection();
}

class CustomDioLocalError extends Failure {
  final LocalErrorType error;
  const CustomDioLocalError({required this.error});
}

class CustomServerError extends Failure {
  final ApiErrorType error;
  const CustomServerError({required this.error});
}

