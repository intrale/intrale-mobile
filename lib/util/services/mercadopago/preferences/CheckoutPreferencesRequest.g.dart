// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckoutPreferencesRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutPreferencesRequest _$CheckoutPreferencesRequestFromJson(
        Map<String, dynamic> json) =>
    CheckoutPreferencesRequest()
      ..additional_info = json['additional_info'] as String?
      ..auto_return = json['auto_return'] as String?
      ..back_urls = json['back_urls'] == null
          ? null
          : BackUrls.fromJson(json['back_urls'] as Map<String, dynamic>)
      ..date_of_expiration = json['date_of_expiration'] as String?
      ..differential_pricing = json['differential_pricing'] == null
          ? null
          : Id.fromJson(json['differential_pricing'] as Map<String, dynamic>)
      ..expiration_date_from = json['expiration_date_from'] as String?
      ..expiration_date_to = json['expiration_date_to'] as String?
      ..expires = json['expires'] as bool?
      ..external_reference = json['external_reference'] as String?
      ..items = (json['items'] as List<dynamic>?)
          ?.map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList()
      ..marketplace = json['marketplace'] as String?
      ..marketplace_fee = json['marketplace_fee'] as int?
      ..notification_url = json['notification_url'] as String?
      ..payer = json['payer'] == null
          ? null
          : Payer.fromJson(json['payer'] as Map<String, dynamic>)
      ..payment_methods = json['payment_methods'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_methods'] as Map<String, dynamic>)
      ..shipments = json['shipments'] == null
          ? null
          : Shipments.fromJson(json['shipments'] as Map<String, dynamic>)
      ..statement_descriptor = json['statement_descriptor'] as String?
      ..tracks = (json['tracks'] as List<dynamic>?)
          ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CheckoutPreferencesRequestToJson(
        CheckoutPreferencesRequest instance) =>
    <String, dynamic>{
      'additional_info': instance.additional_info,
      'auto_return': instance.auto_return,
      'back_urls': instance.back_urls,
      'date_of_expiration': instance.date_of_expiration,
      'differential_pricing': instance.differential_pricing,
      'expiration_date_from': instance.expiration_date_from,
      'expiration_date_to': instance.expiration_date_to,
      'expires': instance.expires,
      'external_reference': instance.external_reference,
      'items': instance.items,
      'marketplace': instance.marketplace,
      'marketplace_fee': instance.marketplace_fee,
      'notification_url': instance.notification_url,
      'payer': instance.payer,
      'payment_methods': instance.payment_methods,
      'shipments': instance.shipments,
      'statement_descriptor': instance.statement_descriptor,
      'tracks': instance.tracks,
    };
