import 'package:intrale/model/Product.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:intrale/util/services/Error.dart';

part 'ReadProductsResponse.g.dart';

@JsonSerializable()
class ReadProductsResponse extends Response {
  List<Product>? products;

  ReadProductsResponse({required this.products}) {}

  factory ReadProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReadProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReadProductsResponseToJson(this);
}
