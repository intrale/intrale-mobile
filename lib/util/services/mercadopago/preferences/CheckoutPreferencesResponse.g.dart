// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckoutPreferencesResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutPreferencesResponse _$CheckoutPreferencesResponseFromJson(
        Map<String, dynamic> json) =>
    CheckoutPreferencesResponse()
      ..statusCode = json['statusCode'] as int?
      ..errors = (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList()
      ..collector_id = json['collector_id'] as int?
      ..operation_type = json['operation_type'] as String?
      ..items = (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList()
      ..address = json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>)
      ..back_urls = json['back_urls'] == null
          ? null
          : BackUrls.fromJson(json['back_urls'] as Map<String, dynamic>)
      ..auto_return = json['auto_return'] as String?
      ..payment_methods = json['payment_methods'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_methods'] as Map<String, dynamic>)
      ..client_id = json['client_id'] as String?
      ..marketplace = json['marketplace'] as String?
      ..marketplace_fee = json['marketplace_fee'] as int?
      ..shipments = json['shipments'] == null
          ? null
          : Shipments.fromJson(json['shipments'] as Map<String, dynamic>)
      ..notification_url = json['notification_url'] as String?
      ..statement_descriptor = json['statement_descriptor'] as String?
      ..external_reference = json['external_reference'] as String?
      ..additional_info = json['additional_info'] as String?
      ..expires = json['expires'] as bool?
      ..expiration_date_from = json['expiration_date_from'] as String?
      ..expiration_date_to = json['expiration_date_to'] as String?
      ..date_created = json['date_created'] as String?
      ..id = json['id'] as String?
      ..init_point = json['init_point'] as String?
      ..sandbox_init_point = json['sandbox_init_point'] as String?;

Map<String, dynamic> _$CheckoutPreferencesResponseToJson(
        CheckoutPreferencesResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'collector_id': instance.collector_id,
      'operation_type': instance.operation_type,
      'items': instance.items,
      'address': instance.address,
      'back_urls': instance.back_urls,
      'auto_return': instance.auto_return,
      'payment_methods': instance.payment_methods,
      'client_id': instance.client_id,
      'marketplace': instance.marketplace,
      'marketplace_fee': instance.marketplace_fee,
      'shipments': instance.shipments,
      'notification_url': instance.notification_url,
      'statement_descriptor': instance.statement_descriptor,
      'external_reference': instance.external_reference,
      'additional_info': instance.additional_info,
      'expires': instance.expires,
      'expiration_date_from': instance.expiration_date_from,
      'expiration_date_to': instance.expiration_date_to,
      'date_created': instance.date_created,
      'id': instance.id,
      'init_point': instance.init_point,
      'sandbox_init_point': instance.sandbox_init_point,
    };
