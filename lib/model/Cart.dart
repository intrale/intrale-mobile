import 'package:intrale/model/CartItem.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Cart.g.dart';

@JsonSerializable()
class Cart {

  Set<CartItem> items = Set<CartItem>();

  //List<CartItem> items = [];

  Cart();

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
