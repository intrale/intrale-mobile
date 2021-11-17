// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Phone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phone _$PhoneFromJson(Map<String, dynamic> json) => Phone()
  ..area_code = json['area_code'] as String?
  ..number = json['number'] as String?;

Map<String, dynamic> _$PhoneToJson(Phone instance) => <String, dynamic>{
      'area_code': instance.area_code,
      'number': instance.number,
    };
