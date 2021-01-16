// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignupResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) {
  return SignupResponse(
    username: json['username'] as String,
    userStatus: json['userStatus'] as String,
    enabled: json['enabled'] as bool,
  )
    ..statusCode = json['statusCode'] as int
    ..errors = (json['errors'] as List)
        ?.map(
            (e) => e == null ? null : Error.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'username': instance.username,
      'userStatus': instance.userStatus,
      'enabled': instance.enabled,
    };
