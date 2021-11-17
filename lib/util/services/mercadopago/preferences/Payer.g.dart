// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Payer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payer _$PayerFromJson(Map<String, dynamic> json) => Payer()
  ..name = json['name'] as String?
  ..surname = json['surname'] as String?
  ..email = json['email'] as String?
  ..phone = json['phone'] == null
      ? null
      : Phone.fromJson(json['phone'] as Map<String, dynamic>)
  ..identification = json['identification'] == null
      ? null
      : Identification.fromJson(json['identification'] as Map<String, dynamic>)
  ..address = json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>)
  ..date_created = json['date_created'] as String?;

Map<String, dynamic> _$PayerToJson(Payer instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'email': instance.email,
      'phone': instance.phone,
      'identification': instance.identification,
      'address': instance.address,
      'date_created': instance.date_created,
    };
