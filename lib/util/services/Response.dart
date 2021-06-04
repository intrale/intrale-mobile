import 'package:intrale/util/services/Error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Response.g.dart';

@JsonSerializable()
class Response {
  int statusCode;
  List<Error> errors;

  Response({this.statusCode, this.errors}) {}

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
