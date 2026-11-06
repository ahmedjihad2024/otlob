import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/features/sign_in/data/request/sign_in_request.dart';
import 'package:otlob/features/sign_in/domain/model/sign_in_user.dart';

abstract class SignInRepositoryAbs {
  Future<Either<Failure, SignInUser>> signIn(SignInRequest request);
}
