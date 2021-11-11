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
      {this.name = '',
      this.familyName = '',
      required this.username,
      required this.password,
      this.newPassword = '',
      required this.email})
      : super();

  factory SigninRequest.fromJson(Map<String, dynamic> json) =>
      _$SigninRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRequestToJson(this);
}
