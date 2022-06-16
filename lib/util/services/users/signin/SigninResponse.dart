import 'package:intrale/util/services/Response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:intrale/util/services/Error.dart';

part 'SigninResponse.g.dart';

@JsonSerializable()
class SigninResponse extends Response {
  String idToken;
  String accessToken;
  String refreshToken;

  SigninResponse(
      {required this.idToken,
      required this.accessToken,
      required this.refreshToken}) {}

  factory SigninResponse.fromJson(Map<String, dynamic> json) =>
      _$SigninResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SigninResponseToJson(this);
}
