import 'package:json_annotation/json_annotation.dart';

part 'Address.g.dart';

@JsonSerializable()
class Address {
  String? street_name;
  int? street_number;
  String? zip_code;

  Address() {}

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
