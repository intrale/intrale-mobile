import 'package:intrale/util/services/Request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'RecoveryRequest.g.dart';

@JsonSerializable()
class RecoveryRequest extends Request {
  String email;

  RecoveryRequest({required this.email}) : super();

  factory RecoveryRequest.fromJson(Map<String, dynamic> json) =>
      _$RecoveryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RecoveryRequestToJson(this);
}
