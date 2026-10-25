import 'package:dio/dio.dart';
import 'package:otlob/features/sign_in/data/request/sign_in_request.dart';
import 'package:otlob/features/sign_in/data/responses/sign_in_response.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_in_api_services.g.dart';

@RestApi()
abstract class SignInApiService {
  factory SignInApiService(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _SignInApiService;

  @POST('/api/Account/Login')
  Future<SignInResponse> signIn(
    @Body() SignInRequest request,
  );
}
