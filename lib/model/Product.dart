import 'package:json_annotation/json_annotation.dart';

import 'Price.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product {
  String id;
  String name;
  String description;
  int stock;
  Price price;
  String pictureUrl;
  String category;

  Product(
      {this.id,
      this.name,
      this.description,
      this.stock,
      this.price,
      this.pictureUrl,
      this.category}) {}

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
