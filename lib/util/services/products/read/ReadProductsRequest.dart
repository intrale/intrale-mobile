import 'package:intrale/util/services/Request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ReadProductsRequest.g.dart';

@JsonSerializable()
class ReadProductsRequest extends Request {
  String productId;
  String category;
  String name;
  String description;
  int fromStock;
  int toStock;
  String currencyAcronym;
  double fromPrice;
  double toPrice;

  ReadProductsRequest() : super();

  factory ReadProductsRequest.fromJson(Map<String, dynamic> json) =>
      _$ReadProductsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ReadProductsRequestToJson(this);
}
