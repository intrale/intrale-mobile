import 'package:intrale/util/services/mercadopago/preferences/Id.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Shipments.g.dart';

@JsonSerializable()
class Shipments {
  String? mode;
  bool? local_pickup;
  String? dimensions;
  int? default_shipping_method;
  List<Id>? free_methods;
  double? cost;
  bool? free_shipping;
  //receiver_address:ReceiverAddress;

  Shipments() {}

  factory Shipments.fromJson(Map<String, dynamic> json) =>
      _$ShipmentsFromJson(json);

  Map<String, dynamic> toJson() => _$ShipmentsToJson(this);
}
