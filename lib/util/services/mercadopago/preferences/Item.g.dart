// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item()
  ..id = json['id'] as String?
  ..title = json['title'] as String?
  ..description = json['description'] as String?
  ..picture_url = json['picture_url'] as String?
  ..category_id = json['category_id'] as String?
  ..quantity = json['quantity'] as int?
  ..currency_id = json['currency_id'] as String?
  ..unit_price = (json['unit_price'] as num?)?.toDouble();

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'picture_url': instance.picture_url,
      'category_id': instance.category_id,
      'quantity': instance.quantity,
      'currency_id': instance.currency_id,
      'unit_price': instance.unit_price,
    };
