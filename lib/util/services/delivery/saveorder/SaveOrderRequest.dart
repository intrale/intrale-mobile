import 'package:intrale/model/OrderProduct.dart';
import 'package:intrale/util/services/Request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SaveOrderRequest.g.dart';

@JsonSerializable()
class SaveOrderRequest extends Request {
  String orderId;
  String email;
  String deliveryLocation;
  int? collectorId;
  List<OrderProduct>? products;

  SaveOrderRequest(
      {this.orderId = '',
      required this.email,
      this.products,
      required this.deliveryLocation,
      this.collectorId
      })
      : super();

  factory SaveOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveOrderRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaveOrderRequestToJson(this);
}
