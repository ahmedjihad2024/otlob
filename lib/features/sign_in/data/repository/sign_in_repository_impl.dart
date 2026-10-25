import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/error_handler.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/features/sign_in/data/data_source/sign_in_remote_data_source.dart';
import 'package:otlob/features/sign_in/data/mapper/sign_in_mapper.dart';
import 'package:otlob/features/sign_in/data/request/sign_in_request.dart';
import 'package:otlob/features/sign_in/data/responses/sign_in_response.dart';
import 'package:otlob/features/sign_in/domain/model/sign_in_user.dart';
import 'package:otlob/features/sign_in/domain/repository/sign_in_repository_abs.dart';

class SignInRepositoryImpl implements SignInRepositoryAbs {
  final SignInRemoteDataSource _remoteDataSource;

  SignInRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, SignInUser>> signIn(SignInRequest request) {
    return fastHandler<SignInResponse, SignInUser>(
      request: () => _remoteDataSource.signIn(request),
      mapper: (response) => response.toDomain(),
    );
  }
}
