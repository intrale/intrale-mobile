// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SaveNotificationTokenRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveNotificationTokenRequest _$SaveNotificationTokenRequestFromJson(
        Map<String, dynamic> json) =>
    SaveNotificationTokenRequest()
      ..requestId = json['requestId'] as String
      ..email = json['email'] as String?
      ..token = json['token'] as String?
      ..device = json['device'] as String?;

Map<String, dynamic> _$SaveNotificationTokenRequestToJson(
        SaveNotificationTokenRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'email': instance.email,
      'token': instance.token,
      'device': instance.device,
    };
