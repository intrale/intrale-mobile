import 'package:intrale/util/services/Request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ConfirmRecoveryRequest.g.dart';

@JsonSerializable()
class ConfirmRecoveryRequest extends Request {
  String email;
  String password;
  String code;

  ConfirmRecoveryRequest({this.email, this.password, this.code}) : super();

  factory ConfirmRecoveryRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmRecoveryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmRecoveryRequestToJson(this);
}
