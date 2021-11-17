import 'package:json_annotation/json_annotation.dart';

part 'Identification.g.dart';

@JsonSerializable()
class Identification {
  String? type;
  String? number;

  Identification() {}

  factory Identification.fromJson(Map<String, dynamic> json) =>
      _$IdentificationFromJson(json);

  Map<String, dynamic> toJson() => _$IdentificationToJson(this);
}
