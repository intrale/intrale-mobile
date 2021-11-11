import 'package:json_annotation/json_annotation.dart';

part 'Error.g.dart';

@JsonSerializable()
class Error {
  String? code;
  String? description;

  Error({required this.code, required this.description}) {}

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
