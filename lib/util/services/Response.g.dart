// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) {
  return Response(
    statusCode: json['statusCode'] as int,
    errors: (json['errors'] as List)
        ?.map(
            (e) => e == null ? null : Error.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
    };
