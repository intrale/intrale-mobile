import 'package:json_annotation/json_annotation.dart';

part 'OrderProduct.g.dart';

@JsonSerializable()
class OrderProduct {
  String productId;
  int count;

  OrderProduct(
      {required this.productId,
      required this.count}) {}

  factory OrderProduct.fromJson(Map<String, dynamic> json) =>
      _$OrderProductFromJson(json);

  Map<String, dynamic> toJson() => _$OrderProductToJson(this);
}
