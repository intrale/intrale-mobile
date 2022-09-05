import 'package:intrale/util/services/Request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SaveNotificationTokenRequest.g.dart';

@JsonSerializable()
class SaveNotificationTokenRequest extends Request {
  String? email;
  String? token;
  String? device;

  SaveNotificationTokenRequest() : super();

  factory SaveNotificationTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveNotificationTokenRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaveNotificationTokenRequestToJson(this);
}
