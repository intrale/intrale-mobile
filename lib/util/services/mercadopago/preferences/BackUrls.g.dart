// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BackUrls.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackUrls _$BackUrlsFromJson(Map<String, dynamic> json) => BackUrls()
  ..success = json['success'] as String?
  ..pending = json['pending'] as String?
  ..failure = json['failure'] as String?;

Map<String, dynamic> _$BackUrlsToJson(BackUrls instance) => <String, dynamic>{
      'success': instance.success,
      'pending': instance.pending,
      'failure': instance.failure,
    };
