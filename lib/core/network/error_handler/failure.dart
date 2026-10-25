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

extension FailureMessage on Failure {
  String get message => switch (this) {
    ServerError(:final message) => message ?? 'Server Error',
    UnexpectedError(:final message) => message ?? 'Unexpected Error',
    NoInternetConnection() => 'No internet connection',
  };
}