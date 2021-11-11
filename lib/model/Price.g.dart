// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      currencyAcronym: json['currencyAcronym'] as String,
      unitPrice: (json['unitPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'currencyAcronym': instance.currencyAcronym,
      'unitPrice': instance.unitPrice,
    };
