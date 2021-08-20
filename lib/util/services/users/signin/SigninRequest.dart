import 'package:intrale/util/services/Request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SigninRequest.g.dart';

@JsonSerializable()
class SigninRequest extends Request {
  String name;
  String familyName;
  String username;
  String email;
  String password;
  String newPassword;

  SigninRequest(
      {this.name,
      this.familyName,
      this.username,
      this.password,
      this.newPassword,
      this.email})
      : super();

  factory SigninRequest.fromJson(Map<String, dynamic> json) =>
      _$SigninRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRequestToJson(this);
}
