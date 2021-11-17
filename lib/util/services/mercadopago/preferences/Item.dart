import 'package:intrale/util/services/mercadopago/preferences/Price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Item.g.dart';

@JsonSerializable()
class Item {
  String? id;
  String? title;
  String? description;
  String? picture_url;
  String? category_id;
  int? quantity;

  String? currency_id;
  double? unit_price;

  Item() {}

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
