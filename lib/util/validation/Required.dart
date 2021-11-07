import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/util/validation/Validator.dart';

class Required implements Validator {
  String message;

  String validate(value) {
    if (value.isEmpty) {
      return message;
    }
    return null;
  }

  @override
  void sharingContext(BuildContext context) {
    message = FlutterI18n.translate(context, "required");
  }
}
