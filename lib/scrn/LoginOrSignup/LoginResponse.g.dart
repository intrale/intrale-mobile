// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      username: json['username'] as String,
      userStatus: json['userStatus'] as String,
      enabled: json['enabled'] as bool,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'username': instance.username,
      'userStatus': instance.userStatus,
      'enabled': instance.enabled,
    };
