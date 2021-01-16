import 'package:intrale/util/validation/Validator.dart';

class MinLength implements Validator {
  int length;

  MinLength({this.length}) {}

  String validate(value) {
    if (value.isNotEmpty && value.toString().length >= length) {
      return null;
    }
    return "Debe contener al menos " + length.toString() + " caracteres.";
  }
}
