import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/ItlButton.dart';
import 'package:intrale/comp/ItlEmail.dart';
import 'package:intrale/comp/ItlFields.dart';
import 'package:intrale/scrn/LoginOrSignup/Confirm.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginOrSignupForm.dart';
import 'package:intrale/util/services/Error.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/users/recovery/RecoveryResponse.dart';
import 'package:intrale/util/services/users/recovery/RecoveryService.dart';
import 'package:intrale/util/services/users/signup/SignupRequest.dart';
import 'package:intrale/util/validation/FormatValidation.dart';
import 'package:intrale/util/validation/MultipleValidations.dart';
import 'package:intrale/util/validation/Required.dart';

class Recovery extends StatefulWidget {
  @override
  RecoveryScreenState createState() => RecoveryScreenState();
}

/// Component Widget this layout UI
class RecoveryScreenState extends IntraleState<Recovery> {
  ItlEmail email = ItlEmail(
    descriptionKey: "recovery_email",
    validator: MultipleValidations(validations: [
      Required(),
      FormatValidation(
          regexp: FormatValidation.EMAIL_PATTERN, messageKey: "emailFormat")
    ]),
  );

  // Services declarations
  RecoveryService? recoveryService;

  RecoveryScreenState() {
    recoveryService = RecoveryService(handlers: [okHandler!, errorHandler!]);
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    return LoginOrSignupForm(
        formKey: formKey,
        body: ItlFields(
          children: <Widget>[
            /// padding logo
            Padding(
                padding:
                    EdgeInsets.only(top: mediaQueryData.padding.top + 40.0)),
            header,
            IntraleState.DEFAULT_PADDING,
            email,

            ItlButton(
              descriptionKey: "recovery_submit",
              onTap: () => onSubmit(),
            ),

            haveUserButton,
            notHaveButton,
            haveCodeButton,
          ],
        ));
  }

  @override
  onValidSubmit() {
    recoveryService?.post(request: SignupRequest(email: this.email.value));
  }

  void onOk(Response response) {
    context.go('/confirm');
  }

  void onError(Response response) {
    Error error = response.errors!.first;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Ocurrio un error:" + (error.code)),
              content: Text(error.description));
        });
  }
}
