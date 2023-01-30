// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProduct _$OrderProductFromJson(Map<String, dynamic> json) => OrderProduct(
      productId: json['productId'] as String,
      count: json['count'] as int,
    );

Map<String, dynamic> _$OrderProductToJson(OrderProduct instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'count': instance.count,
    };
