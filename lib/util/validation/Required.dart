import 'package:intrale/util/validation/Validator.dart';

class Required implements Validator {
  String validate(value) {
    if (value.isEmpty) {
      return 'El campo es obligatorio';
    }
    return null;
  }
}
