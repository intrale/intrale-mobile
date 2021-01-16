import 'package:intrale/util/validation/Validator.dart';

class MaxLength implements Validator {
  int length;

  MaxLength({this.length}) {}

  String validate(value) {
    if (value.isNotEmpty && value.toString().length < length) {
      return null;
    }
    return "Puede contener hasta " + length.toString() + " caracteres.";
  }
}
