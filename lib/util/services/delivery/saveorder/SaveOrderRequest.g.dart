// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SaveOrderRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveOrderRequest _$SaveOrderRequestFromJson(Map<String, dynamic> json) =>
    SaveOrderRequest(
      orderId: json['orderId'] as String? ?? '',
      email: json['email'] as String,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => OrderProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryLocation: json['deliveryLocation'] as String,
      collectorId: json['collectorId'] as int?,
    )..requestId = json['requestId'] as String;

Map<String, dynamic> _$SaveOrderRequestToJson(SaveOrderRequest instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'orderId': instance.orderId,
      'email': instance.email,
      'deliveryLocation': instance.deliveryLocation,
      'collectorId': instance.collectorId,
      'products': instance.products,
    };
