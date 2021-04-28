// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConfirmRecoveryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmRecoveryResponse _$ConfirmRecoveryResponseFromJson(
    Map<String, dynamic> json) {
  return ConfirmRecoveryResponse(
    email: json['email'] as String,
  )
    ..statusCode = json['statusCode'] as int
    ..errors = (json['errors'] as List)
        ?.map(
            (e) => e == null ? null : Error.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ConfirmRecoveryResponseToJson(
        ConfirmRecoveryResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'email': instance.email,
    };
