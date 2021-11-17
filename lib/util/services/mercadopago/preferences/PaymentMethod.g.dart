// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentMethod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod()
      ..excluded_payment_methods =
          (json['excluded_payment_methods'] as List<dynamic>?)
              ?.map((e) => Id.fromJson(e as Map<String, dynamic>))
              .toList()
      ..excluded_payment_types =
          (json['excluded_payment_types'] as List<dynamic>?)
              ?.map((e) => Id.fromJson(e as Map<String, dynamic>))
              .toList()
      ..default_payment_method_id = json['default_payment_method_id'] as String?
      ..installments = json['installments'] as int?
      ..default_installments = json['default_installments'] as int?;

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'excluded_payment_methods': instance.excluded_payment_methods,
      'excluded_payment_types': instance.excluded_payment_types,
      'default_payment_method_id': instance.default_payment_method_id,
      'installments': instance.installments,
      'default_installments': instance.default_installments,
    };
