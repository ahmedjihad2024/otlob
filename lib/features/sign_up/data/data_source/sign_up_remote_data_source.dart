import 'package:otlob/features/sign_up/data/api/sign_up_api_services.dart';
import 'package:otlob/features/sign_up/data/request/sign_up_request.dart';
import 'package:otlob/features/sign_up/data/responses/sign_up_response.dart';

abstract class SignUpRemoteDataSource {
  Future<SignUpResponse> signUp(SignUpRequest request);
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final SignUpApiService _apiService;

  SignUpRemoteDataSourceImpl(this._apiService);

  @override
  Future<SignUpResponse> signUp(SignUpRequest request) {
    return _apiService.signUp(request);
  }
}
