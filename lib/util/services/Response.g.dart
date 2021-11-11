// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      statusCode: json['statusCode'] as int? ?? 200,
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
              .toList() ??
          DEFAULT_ERROR_LIST,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
    };
