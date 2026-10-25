// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    _SignUpRequest(
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignUpRequestToJson(_SignUpRequest instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
