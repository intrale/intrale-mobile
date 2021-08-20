// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReadProductsRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadProductsRequest _$ReadProductsRequestFromJson(Map<String, dynamic> json) {
  return ReadProductsRequest()
    ..requestId = json['requestId'] as String
    ..productId = json['productId'] as String
    ..category = json['category'] as String
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..fromStock = json['fromStock'] as int
    ..toStock = json['toStock'] as int
    ..currencyAcronym = json['currencyAcronym'] as String
    ..fromPrice = (json['fromPrice'] as num)?.toDouble()
    ..toPrice = (json['toPrice'] as num)?.toDouble();
}

Map<String, dynamic> _$ReadProductsRequestToJson(
        ReadProductsRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'productId': instance.productId,
      'category': instance.category,
      'name': instance.name,
      'description': instance.description,
      'fromStock': instance.fromStock,
      'toStock': instance.toStock,
      'currencyAcronym': instance.currencyAcronym,
      'fromPrice': instance.fromPrice,
      'toPrice': instance.toPrice,
    };
