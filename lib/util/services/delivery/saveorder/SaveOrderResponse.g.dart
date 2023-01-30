// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SaveOrderResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveOrderResponse _$SaveOrderResponseFromJson(Map<String, dynamic> json) =>
    SaveOrderResponse(
      idToken: json['idToken'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    )
      ..statusCode = json['statusCode'] as int?
      ..errors = (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SaveOrderResponseToJson(SaveOrderResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'idToken': instance.idToken,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
