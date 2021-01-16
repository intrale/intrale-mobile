import 'package:intrale/util/services/Request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SignupRequest.g.dart';

@JsonSerializable()
class SignupRequest extends Request {
  String name;
  String familyName;
  String username;
  String email;
  String password;
  String newPassword;

  SignupRequest(
      {this.name,
      this.familyName,
      this.username,
      this.password,
      this.newPassword,
      this.email}) : super(businessName: 'test', requestId: '#1');

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
