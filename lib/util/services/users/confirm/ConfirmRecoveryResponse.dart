import 'package:intrale/util/services/Response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:intrale/util/services/Error.dart';

part 'ConfirmRecoveryResponse.g.dart';

@JsonSerializable()
class ConfirmRecoveryResponse extends Response {
  String email;

  ConfirmRecoveryResponse({required this.email}) {}

  factory ConfirmRecoveryResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmRecoveryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmRecoveryResponseToJson(this);
}
