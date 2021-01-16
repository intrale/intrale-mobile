// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return Error(
    code: json['code'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
    };
