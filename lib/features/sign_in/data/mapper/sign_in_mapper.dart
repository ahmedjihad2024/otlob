import 'package:otlob/features/sign_in/data/responses/sign_in_response.dart';
import 'package:otlob/features/sign_in/domain/model/sign_in_user.dart';

extension SignInResponseMapper on SignInResponse? {
  SignInUser toDomain() {
    return SignInUser(
      displayName: this?.displayName ?? '',
      email: this?.email ?? '',
      token: this?.token ?? '',
    );
  }
}
