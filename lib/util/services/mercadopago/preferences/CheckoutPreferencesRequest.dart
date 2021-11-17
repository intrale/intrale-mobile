import 'package:intrale/util/services/mercadopago/preferences/BackUrls.dart';
import 'package:intrale/util/services/mercadopago/preferences/Id.dart';
import 'package:intrale/util/services/mercadopago/preferences/PaymentMethod.dart';
import 'package:intrale/util/services/mercadopago/preferences/Item.dart';
import 'package:intrale/util/services/mercadopago/preferences/Shipments.dart';
import 'package:intrale/util/services/mercadopago/preferences/Track.dart';
import 'package:json_annotation/json_annotation.dart';

import 'Payer.dart';

part 'CheckoutPreferencesRequest.g.dart';

@JsonSerializable()
class CheckoutPreferencesRequest {
  String? additional_info;
  String? auto_return;
  BackUrls? back_urls;
  String? date_of_expiration;
  Id? differential_pricing;
  String? expiration_date_from;
  String? expiration_date_to;
  bool? expires;
  String? external_reference;
  List<Item>? items;
  String? marketplace;
  int? marketplace_fee;
  String? notification_url;
  Payer? payer;
  PaymentMethod? payment_methods;
  Shipments? shipments;
  String? statement_descriptor;
  List<Track>? tracks;

  CheckoutPreferencesRequest() {}

  factory CheckoutPreferencesRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutPreferencesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutPreferencesRequestToJson(this);
}
