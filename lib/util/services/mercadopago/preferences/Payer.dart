import 'package:intrale/util/services/mercadopago/preferences/Address.dart';
import 'package:intrale/util/services/mercadopago/preferences/Identification.dart';
import 'package:intrale/util/services/mercadopago/preferences/Phone.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Payer.g.dart';

@JsonSerializable()
class Payer {
  String? name;
  String? surname;
  String? email;
  Phone? phone;
  Identification? identification;
  Address? address;
  String? date_created;

  Payer() {}

  factory Payer.fromJson(Map<String, dynamic> json) => _$PayerFromJson(json);

  Map<String, dynamic> toJson() => _$PayerToJson(this);
}
