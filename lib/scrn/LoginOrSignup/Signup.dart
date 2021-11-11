import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/ItlButton.dart';
import 'package:intrale/comp/ItlEmail.dart';
import 'package:intrale/comp/ItlFields.dart';
import 'package:intrale/comp/ItlText.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginOrSignupForm.dart';

import 'package:intrale/scrn/LoginOrSignup/Login.dart';
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

  late SignupService signupService;

  SignupScreenState() : super() {
    signupService = new SignupService(handlers: [okHandler, errorHandler]);
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

  @override
  onValidSubmit() {
    signupService
        .post(request: SignupRequest(email: this.email.value))
        .then((value) => {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: ItlText(textKey: "review"),
                      actions: [
                        TextButton(
                            child: ItlText(textKey: "signup_ok"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    );
                  })
            });
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => new Login()));
  }
}
