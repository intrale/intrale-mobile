import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Request.g.dart';

@JsonSerializable()
class Request {
  String requestId = Uuid().v4();

  Request() {}

  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToJson(this);
}
