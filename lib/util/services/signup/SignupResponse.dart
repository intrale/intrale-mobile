import 'package:intrale/util/services/Response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:intrale/util/services/Error.dart';

part 'SignupResponse.g.dart';

@JsonSerializable()
class SignupResponse extends Response {
  String username;
  String userStatus;
  bool enabled;

  SignupResponse({this.username, this.userStatus, this.enabled}) {}

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
