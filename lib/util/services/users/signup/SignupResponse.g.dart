// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignupResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) {
  return SignupResponse(
    businessName: json['businessName'] as String,
    email: json['email'] as String,
  )
    ..statusCode = json['statusCode'] as int
    ..errors = (json['errors'] as List)
        ?.map(
            (e) => e == null ? null : Error.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'businessName': instance.businessName,
      'email': instance.email,
    };
