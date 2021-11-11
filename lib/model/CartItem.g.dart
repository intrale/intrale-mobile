// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CartItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
      count: json['count'] as int,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'count': instance.count,
    };
