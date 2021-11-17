import 'package:json_annotation/json_annotation.dart';

part 'Id.g.dart';

@JsonSerializable()
class Id {
  String? id;

  Id() {}

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}
