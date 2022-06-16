import 'package:intrale/model/Price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CartItem.g.dart';

@JsonSerializable()
class CartItem {
  String id;
  String name;
  String description;
  Price price;
  int count;

  //CartItem() {}

  CartItem(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.count});

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  String getTotalPrice() {
    return price.currencyAcronym + (price.unitPrice * count).toString();
  }

  void increase() {
    count = count + 1;
  }

  void decrease() {
    if (count > 1) {
      count = count - 1;
    }
  }
}