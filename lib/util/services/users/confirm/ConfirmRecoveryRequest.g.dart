// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConfirmRecoveryRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmRecoveryRequest _$ConfirmRecoveryRequestFromJson(
    Map<String, dynamic> json) {
  return ConfirmRecoveryRequest(
    email: json['email'] as String,
    password: json['password'] as String,
    code: json['code'] as String,
  )..requestId = json['requestId'] as String;
}

Map<String, dynamic> _$ConfirmRecoveryRequestToJson(
        ConfirmRecoveryRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'email': instance.email,
      'password': instance.password,
      'code': instance.code,
    };
