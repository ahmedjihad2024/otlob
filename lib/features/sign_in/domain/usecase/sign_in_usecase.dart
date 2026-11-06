import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/usecase/base.dart';
import 'package:otlob/features/sign_in/data/request/sign_in_request.dart';
import 'package:otlob/features/sign_in/domain/model/sign_in_user.dart';
import 'package:otlob/features/sign_in/domain/repository/sign_in_repository_abs.dart';

class SignInUseCase implements Base<SignInRequest, SignInUser> {
  final SignInRepositoryAbs _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, SignInUser>> execute(SignInRequest request) async {
    return await _repository.signIn(request);
  }
}
