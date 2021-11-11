import 'package:intrale/util/validation/FormatValidation.dart';

class EmailValidation extends FormatValidation {
  EmailValidation()
      : super(
            regexp: FormatValidation.EMAIL_PATTERN, messageKey: "emailFormat");
}
