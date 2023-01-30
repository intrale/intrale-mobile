import 'package:intrale/util/services/Response.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:intrale/util/services/Error.dart';

part 'SaveOrderResponse.g.dart';

@JsonSerializable()
class SaveOrderResponse extends Response {
  String? idToken;
  String? accessToken;
  String? refreshToken;

  SaveOrderResponse(
      {this.idToken,
      this.accessToken,
      this.refreshToken}) {}

  factory SaveOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$SaveOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaveOrderResponseToJson(this);
}
