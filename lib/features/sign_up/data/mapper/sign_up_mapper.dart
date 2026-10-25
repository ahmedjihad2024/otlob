import 'package:otlob/features/sign_up/data/responses/sign_up_response.dart';
import 'package:otlob/features/sign_up/domain/model/sign_up_user.dart';

extension SignUpResponseMapper on SignUpResponse? {
  SignUpUser toDomain() {
    return SignUpUser(
      displayName: this?.displayName ?? '',
      email: this?.email ?? '',
      token: this?.token ?? '',
    );
  }
}
