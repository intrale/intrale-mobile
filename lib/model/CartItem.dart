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

  CartItem(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.count});

  @override
  bool operator ==(other) {
    if (other is! CartItem) {
      return false;
    }
    return id == other.id;
  }

  @override
  int get hashCode => id.hashCode;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  double getItemPrice(){
    return price.unitPrice * count;
  }

  String getTotalPrice() {
    return price.currencyAcronym + (getItemPrice()).toString();
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
