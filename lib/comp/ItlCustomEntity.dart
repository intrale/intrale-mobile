import 'package:json_annotation/json_annotation.dart';

part 'ItlCustomEntity.g.dart';

@JsonSerializable()
class ItlCustomEntity {
  String businessname = '';
  String api_url = '';

  ItlCustomEntity() {}

  factory ItlCustomEntity.fromJson(Map<String, dynamic> json) =>
      _$ItlCustomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ItlCustomEntityToJson(this);
}
