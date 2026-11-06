import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';

abstract class Base<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

class NoParams {
  const NoParams();
}
