// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    _SignInResponse(
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignInResponseToJson(_SignInResponse instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'token': instance.token,
    };
