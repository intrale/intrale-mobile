// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignupRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) {
  return SignupRequest(
    name: json['name'] as String,
    familyName: json['familyName'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    newPassword: json['newPassword'] as String,
    email: json['email'] as String,
  )
    ..businessName = json['businessName'] as String
    ..requestId = json['requestId'] as String;
}

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'businessName': instance.businessName,
      'requestId': instance.requestId,
      'name': instance.name,
      'familyName': instance.familyName,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'newPassword': instance.newPassword,
    };
