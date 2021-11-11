import 'package:intrale/util/services/Request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SignupRequest.g.dart';

@JsonSerializable()
class SignupRequest extends Request {
  String email;

  SignupRequest({required this.email}) : super();

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
