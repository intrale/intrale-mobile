import 'package:json_annotation/json_annotation.dart';

part 'Track.g.dart';

@JsonSerializable()
class Track {
  String? type;
  String? values;

  Track() {}

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}
