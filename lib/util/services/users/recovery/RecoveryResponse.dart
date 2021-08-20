import 'package:intrale/util/services/Response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:intrale/util/services/Error.dart';

part 'RecoveryResponse.g.dart';

@JsonSerializable()
class RecoveryResponse extends Response {
  String email;

  RecoveryResponse({this.email}) {}

  factory RecoveryResponse.fromJson(Map<String, dynamic> json) =>
      _$RecoveryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecoveryResponseToJson(this);
}
