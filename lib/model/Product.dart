import 'package:json_annotation/json_annotation.dart';

import 'Price.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product {
  String id;
  String name;
  String description;
  int? stock;
  Price? price;
  String? pictureUrl;
  String? category;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.stock,
      required this.price,
      required this.pictureUrl,
      required this.category}) {}

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
