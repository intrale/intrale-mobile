import 'package:flutter/material.dart';
import 'package:intrale/util/validation/Validator.dart';

class MultipleValidations implements Validator {
  List<Validator> validations = [];

  MultipleValidations({required this.validations}) {}

  String? validate(value) {
    Iterator<Validator> it = validations.iterator;
    while (it.moveNext()) {
      Validator validator = it.current;
      String? result = validator.validate(value);
      if (result != null && result.trim().isNotEmpty) {
        return result;
      }
    }
    return null;
  }

  @override
  void sharingContext(BuildContext context) {
    validations.forEach((element) {
      element.sharingContext(context);
    });
  }
}
