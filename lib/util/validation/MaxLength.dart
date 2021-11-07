import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/util/validation/Validator.dart';

class MaxLength implements Validator {
  int length;
  String message;

  MaxLength({this.length}) {}

  String validate(value) {
    if (value.isNotEmpty && value.toString().length < length) {
      return null;
    }
    return message;
  }

  @override
  void sharingContext(BuildContext context) {
    message = FlutterI18n.translate(context, "maxLength",
        fallbackKey: null, translationParams: {"count": length.toString()});
  }
}
