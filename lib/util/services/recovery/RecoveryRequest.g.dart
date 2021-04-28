// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecoveryRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoveryRequest _$RecoveryRequestFromJson(Map<String, dynamic> json) {
  return RecoveryRequest(
    email: json['email'] as String,
  )
    ..businessName = json['businessName'] as String
    ..requestId = json['requestId'] as String;
}

Map<String, dynamic> _$RecoveryRequestToJson(RecoveryRequest instance) =>
    <String, dynamic>{
      'businessName': instance.businessName,
      'requestId': instance.requestId,
      'email': instance.email,
    };
