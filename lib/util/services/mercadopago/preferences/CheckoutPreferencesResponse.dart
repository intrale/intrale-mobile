import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/mercadopago/preferences/Address.dart';
import 'package:intrale/util/services/mercadopago/preferences/BackUrls.dart';
import 'package:intrale/util/services/mercadopago/preferences/PaymentMethod.dart';
import 'package:intrale/util/services/mercadopago/preferences/Item.dart';
import 'package:intrale/util/services/mercadopago/preferences/Shipments.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:intrale/util/services/Error.dart';

part 'CheckoutPreferencesResponse.g.dart';

@JsonSerializable()
class CheckoutPreferencesResponse extends Response {
  int? collector_id;
  String? operation_type;
  List<Item>? items;
  Address? address;
  BackUrls? back_urls;
  String? auto_return;
  PaymentMethod? payment_methods;
  String? client_id;
  String? marketplace;
  int? marketplace_fee;
  Shipments? shipments;
  String? notification_url;
  String? statement_descriptor;
  String? external_reference;
  String? additional_info;
  bool? expires;
  String? expiration_date_from;
  String? expiration_date_to;
  String? date_created;
  String? id;
  String? init_point;
  String? sandbox_init_point;

  CheckoutPreferencesResponse() {}

  factory CheckoutPreferencesResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutPreferencesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutPreferencesResponseToJson(this);
}
