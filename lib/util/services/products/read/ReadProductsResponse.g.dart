// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ReadProductsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadProductsResponse _$ReadProductsResponseFromJson(
        Map<String, dynamic> json) =>
    ReadProductsResponse(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..statusCode = json['statusCode'] as int?
      ..errors = (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ReadProductsResponseToJson(
        ReadProductsResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'products': instance.products,
    };
