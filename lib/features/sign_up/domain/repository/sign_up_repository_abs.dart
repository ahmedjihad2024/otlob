import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/features/sign_up/data/request/sign_up_request.dart';
import 'package:otlob/features/sign_up/domain/model/sign_up_user.dart';

abstract class SignUpRepositoryAbs {
  Future<Either<Failure, SignUpUser>> signUp(SignUpRequest request);
}
