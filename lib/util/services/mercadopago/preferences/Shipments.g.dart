// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Shipments.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shipments _$ShipmentsFromJson(Map<String, dynamic> json) => Shipments()
  ..mode = json['mode'] as String?
  ..local_pickup = json['local_pickup'] as bool?
  ..dimensions = json['dimensions'] as String?
  ..default_shipping_method = json['default_shipping_method'] as int?
  ..free_methods = (json['free_methods'] as List<dynamic>?)
      ?.map((e) => Id.fromJson(e as Map<String, dynamic>))
      .toList()
  ..cost = (json['cost'] as num?)?.toDouble()
  ..free_shipping = json['free_shipping'] as bool?;

Map<String, dynamic> _$ShipmentsToJson(Shipments instance) => <String, dynamic>{
      'mode': instance.mode,
      'local_pickup': instance.local_pickup,
      'dimensions': instance.dimensions,
      'default_shipping_method': instance.default_shipping_method,
      'free_methods': instance.free_methods,
      'cost': instance.cost,
      'free_shipping': instance.free_shipping,
    };
