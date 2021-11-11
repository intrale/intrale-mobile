// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignupRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest(
      email: json['email'] as String,
    )..requestId = json['requestId'] as String;

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'email': instance.email,
    };
