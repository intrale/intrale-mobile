import 'package:intrale/util/services/Error.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Response.g.dart';

const List<Error> DEFAULT_ERROR_LIST = <Error>[];

@JsonSerializable()
class Response {
  int? statusCode;
  List<Error>? errors;

  Response({this.statusCode = 200, this.errors = DEFAULT_ERROR_LIST}) {}

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
