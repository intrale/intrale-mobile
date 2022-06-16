// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RecoveryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoveryResponse _$RecoveryResponseFromJson(Map<String, dynamic> json) =>
    RecoveryResponse(
      email: json['email'] as String,
    )
      ..statusCode = json['statusCode'] as int?
      ..errors = (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RecoveryResponseToJson(RecoveryResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'email': instance.email,
    };
