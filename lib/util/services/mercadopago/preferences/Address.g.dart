// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address()
  ..street_name = json['street_name'] as String?
  ..street_number = json['street_number'] as int?
  ..zip_code = json['zip_code'] as String?;

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street_name': instance.street_name,
      'street_number': instance.street_number,
      'zip_code': instance.zip_code,
    };
