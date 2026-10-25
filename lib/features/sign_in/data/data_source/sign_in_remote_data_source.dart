import 'package:otlob/features/sign_in/data/api/sign_in_api_services.dart';
import 'package:otlob/features/sign_in/data/request/sign_in_request.dart';
import 'package:otlob/features/sign_in/data/responses/sign_in_response.dart';

abstract class SignInRemoteDataSource {
  Future<SignInResponse> signIn(SignInRequest request);
}

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  final SignInApiService _apiService;

  SignInRemoteDataSourceImpl(this._apiService);

  @override
  Future<SignInResponse> signIn(SignInRequest request) {
    return _apiService.signIn(request);
  }
}
