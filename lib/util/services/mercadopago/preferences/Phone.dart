import 'package:json_annotation/json_annotation.dart';

part 'Phone.g.dart';

@JsonSerializable()
class Phone {
  String? area_code;
  String? number;

  Phone() {}

  factory Phone.fromJson(Map<String, dynamic> json) => _$PhoneFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneToJson(this);
}
