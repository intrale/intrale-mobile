import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/comp/IntraleMessageDialog.dart';

import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/ItlButton.dart';
import 'package:intrale/comp/ItlEmail.dart';
import 'package:intrale/comp/ItlFields.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginOrSignupForm.dart';

import 'package:intrale/util/services/users/signup/SignupRequest.dart';
import 'package:intrale/util/services/users/signup/SignupService.dart';
import 'package:intrale/util/validation/FormatValidation.dart';
import 'package:intrale/util/validation/MultipleValidations.dart';

import 'package:intrale/util/validation/Required.dart';

class Signup extends StatefulWidget {
  @override
  SignupScreenState createState() => SignupScreenState();
}

/// Component Widget this layout UI
class SignupScreenState extends IntraleState<Signup> {

  ItlEmail email = ItlEmail(
    descriptionKey: "signup_email",
    validator: MultipleValidations(validations: [
      Required(),
      FormatValidation(
          regexp: FormatValidation.EMAIL_PATTERN, messageKey: "emailFormat")
    ]),
  );

  SignupService? signupService;

  SignupScreenState() : super() {
    signupService = new SignupService(handlers: [okHandler!, errorHandler!]);
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
              descriptionKey: "signup_submit",
              onTap: () => onSubmit(),
            ),

            haveUserButton,
            missingButton,
            haveCodeButton,
          ],
        ));
  }

  showDialogSignupOk(){
    debugPrint('showDialogSignupOk');
    IntraleMessageDialog dialog = IntraleMessageDialog(titleKey: "reviewTitle", contentKey: "review", buttonKey: "signup_ok", 
              onPressButton: ()=>context.go('/login'));
    dialog.show(context);
  }

  @override
  onValidSubmit() {
    signupService
        ?.post(request: SignupRequest(email: this.email.value))
        .then((value) => showDialogSignupOk())
        .onError((error, stackTrace) => debugPrint('Ocurrio un error onValidSubmit:' + error.toString()));
  }
}
