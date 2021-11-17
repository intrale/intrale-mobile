import 'package:intrale/util/services/mercadopago/preferences/Id.dart';
import 'package:json_annotation/json_annotation.dart';

part 'PaymentMethod.g.dart';

@JsonSerializable()
class PaymentMethod {
  List<Id>? excluded_payment_methods;
  List<Id>? excluded_payment_types;
  String? default_payment_method_id;
  int? installments;
  int? default_installments;

  PaymentMethod() {}

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
