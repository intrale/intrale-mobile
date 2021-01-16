// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SigninResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninResponse _$SigninResponseFromJson(Map<String, dynamic> json) {
  return SigninResponse(
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

Map<String, dynamic> _$SigninResponseToJson(SigninResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'username': instance.username,
      'userStatus': instance.userStatus,
      'enabled': instance.enabled,
    };
