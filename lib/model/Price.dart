import 'package:json_annotation/json_annotation.dart';

part 'Price.g.dart';

@JsonSerializable()
class Price {
  String currencyAcronym;
  double unitPrice;

  Price({required this.currencyAcronym, required this.unitPrice}) {}

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
