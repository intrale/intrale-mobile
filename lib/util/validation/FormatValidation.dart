import 'package:flutter/material.dart';
import 'package:intrale/util/validation/Validator.dart';

class FormatValidation implements Validator {
  static String EMAIL_PATTERN =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  //static String PASSWORD_PATTERN = '/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[\^$*.\[\]{}\(\)?\-“!@#%&/,><\’:;|_~`])\S{8,99}$/';
  static String PASSWORD_PATTERN =
      '^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#\$%^&=])(?=\\S+\$).{8,}\$';

  String regexp;
  String message;

  FormatValidation({this.regexp, this.message}) {}

  String validate(value) {
    if (value.isNotEmpty) {
      RegExp exp = new RegExp(regexp);
      if (!exp.hasMatch(value)) {
        return message;
      }
    }
    return null;
  }
}
