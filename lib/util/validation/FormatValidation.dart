import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/util/validation/Validator.dart';

class FormatValidation implements Validator {
  static const String EMAIL_PATTERN =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //static String PASSWORD_PATTERN = '/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[\^$*.\[\]{}\(\)?\-“!@#%&/,><\’:;|_~`])\S{8,99}$/';
  static const String PASSWORD_PATTERN =
      '^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#\$%^&=])(?=\\S+\$).{8,}\$';

  String regexp;
  String messageKey;
  String? message;

  FormatValidation({required this.regexp, required this.messageKey});

  String? validate(value) {
    if (value.isNotEmpty) {
      RegExp exp = new RegExp(regexp);
      if (!exp.hasMatch(value)) {
        return message;
      }
    }
    return null;
  }

  @override
  void sharingContext(BuildContext context) {
    message = FlutterI18n.translate(context, messageKey);
  }
}
