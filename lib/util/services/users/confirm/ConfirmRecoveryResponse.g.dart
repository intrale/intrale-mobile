// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConfirmRecoveryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmRecoveryResponse _$ConfirmRecoveryResponseFromJson(
        Map<String, dynamic> json) =>
    ConfirmRecoveryResponse(
      email: json['email'] as String,
    )
      ..statusCode = json['statusCode'] as int?
      ..errors = (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ConfirmRecoveryResponseToJson(
        ConfirmRecoveryResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'email': instance.email,
    };
