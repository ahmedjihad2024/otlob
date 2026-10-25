// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    _SignUpResponse(
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignUpResponseToJson(_SignUpResponse instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'token': instance.token,
    };
