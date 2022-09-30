import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/comp/IntraleMessageDialog.dart';
import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/buttons/SolidButton.dart';
import 'package:intrale/comp/ItlEmail.dart';
import 'package:intrale/comp/ItlFields.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginOrSignupForm.dart';
import 'package:intrale/styles/IntraleStyles.dart';
import 'package:intrale/util/services/Error.dart';
import 'package:intrale/util/services/Response.dart';
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
            Styles.PADDING_STYLES.EDGE_INSETS_ALL_10,
            email,

            SolidButton(
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
    IntraleMessageDialog dialog = 
        IntraleMessageDialog(
              titleKey: "reviewTitle", 
              contentKey: "review", 
              buttonKey: "signup_ok", 
              onPressButton: () => Future(()=>context.go('/confirm')));
    dialog.show(context);
  }

  void onError(Response response) {
    Error error = response.errors!.first;
    IntraleMessageDialog dialog = 
        IntraleMessageDialog(
              titleKey: "errorTitle", 
              contentKey: "error", 
              buttonKey: "signup_ok", 
              onPressButton: () => Future(()=>Navigator.of(context).pop()));
    dialog.show(context);
  }
}
