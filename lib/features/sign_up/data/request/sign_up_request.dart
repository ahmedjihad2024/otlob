import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request.freezed.dart';
part 'sign_up_request.g.dart';

@freezed
abstract class SignUpRequest with _$SignUpRequest {
  const factory SignUpRequest({
    @JsonKey(name: 'displayName') required String displayName,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'phoneNumber') required String phoneNumber,
    @JsonKey(name: 'password') required String password,
  }) = _SignUpRequest;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestFromJson(json);
}
