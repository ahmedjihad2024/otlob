import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response.freezed.dart';
part 'sign_in_response.g.dart';

@freezed
abstract class SignInResponse with _$SignInResponse {
  const factory SignInResponse({
    @JsonKey(name: 'displayName') String? displayName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'token') String? token,
  }) = _SignInResponse;

  factory SignInResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseFromJson(json);
}
