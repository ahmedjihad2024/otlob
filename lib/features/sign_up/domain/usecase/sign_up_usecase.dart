import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/features/sign_up/data/request/sign_up_request.dart';
import 'package:otlob/features/sign_up/domain/model/sign_up_user.dart';
import 'package:otlob/features/sign_up/domain/repository/sign_up_repository_abs.dart';

class SignUpUseCase implements Base<SignUpRequest, SignUpUser> {
  final SignUpRepositoryAbs _repository;

  SignUpUseCase(this._repository);

  @override
  Future<Either<Failure, SignUpUser>> execute(SignUpRequest request) async {
    return await _repository.signUp(request);
  }
}
