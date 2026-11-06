import 'package:dartz/dartz.dart';
import 'package:otlob/core/network/error_handler/error_handler.dart';
import 'package:otlob/core/network/error_handler/failure.dart';
import 'package:otlob/core/network/failure_message.dart';
import 'package:otlob/features/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:otlob/features/sign_up/data/mapper/sign_up_mapper.dart';
import 'package:otlob/features/sign_up/data/request/sign_up_request.dart';
import 'package:otlob/features/sign_up/data/responses/sign_up_response.dart';
import 'package:otlob/features/sign_up/domain/model/sign_up_user.dart';
import 'package:otlob/features/sign_up/domain/repository/sign_up_repository_abs.dart';

class SignUpRepositoryImpl implements SignUpRepositoryAbs {
  final SignUpRemoteDataSource _remoteDataSource;

  SignUpRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, SignUpUser>> signUp(SignUpRequest request) {
    return fastHandler<SignUpResponse, SignUpUser>(
      request: () => _remoteDataSource.signUp(request),
      mapper: (response) => response.toDomain(),
    );
  }
}
