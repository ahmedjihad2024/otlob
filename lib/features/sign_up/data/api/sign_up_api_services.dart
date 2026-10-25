import 'package:dio/dio.dart';
import 'package:otlob/features/sign_up/data/request/sign_up_request.dart';
import 'package:otlob/features/sign_up/data/responses/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_up_api_services.g.dart';

@RestApi()
abstract class SignUpApiService {
  factory SignUpApiService(Dio dio, {String? baseUrl, ParseErrorLogger? errorLogger}) =
      _SignUpApiService;

  @POST('/api/Account/Register')
  Future<SignUpResponse> signUp(
    @Body() SignUpRequest request,
  );
}
