import 'package:json_annotation/json_annotation.dart';

part 'BackUrls.g.dart';

@JsonSerializable()
class BackUrls {
  String? success;
  String? pending;
  String? failure;

  BackUrls() {}

  factory BackUrls.fromJson(Map<String, dynamic> json) =>
      _$BackUrlsFromJson(json);

  Map<String, dynamic> toJson() => _$BackUrlsToJson(this);
}
