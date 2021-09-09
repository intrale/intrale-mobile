import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intrale/comp/IntraleButton.dart';

import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/IntraleTextField.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginScaffold.dart';

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
  // Texts declarations
  Text ok;
  Text review;

  // Fields declarations
  IntraleTextField email;

  // Services declarations
  SignupService signupService;

  // Buttons declarations
  IntraleButton submit;

  // Images declarations

  // Other Components declarations
  Column fields;

  @override
  void buttonsInitializations() {
    submit = IntraleButton(
      description: AppLocalizations.of(context).signup_submit,
      onTap: () => onSubmit(),
    );
  }

  @override
  void fieldsInitializations() {
    email = IntraleTextField(
        icon: Icons.email,
        password: false,
        description: AppLocalizations.of(context).signup_email,
        inputType: TextInputType.emailAddress,
        validator: MultipleValidations(validations: [
          Required(),
          FormatValidation(
              regexp: FormatValidation.EMAIL_PATTERN,
              message: AppLocalizations.of(context).emailFormat)
        ]));
  }

  @override
  void imagesInitializations() {}

  @override
  void othersInitializations() {
    fields = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: AlignmentDirectional.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /// padding logo
                  Padding(
                      padding: EdgeInsets.only(
                          top: mediaQueryData.padding.top + 40.0)),
                  header,
                  Padding(padding: EdgeInsets.all(10)),
                  email,

                  submit,

                  haveUserButton,
                  missingButton,
                  haveCodeButton,
                ],
              ))
        ]);
  }

  @override
  void servicesInitializations() {
    signupService = new SignupService();
  }

  @override
  void textsInitializations() {
    ok = Text(AppLocalizations.of(context).signup_ok);
    review = Text(AppLocalizations.of(context).review);
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    return new Form(
        key: formKey,
        child: LoginScaffold(children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              fields,
            ],
          ),
        ]));
  }

  onSubmit() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await signupService
          .post(SignupRequest(email: this.email.value))
          .then((value) => {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: review,
                        actions: [
                          TextButton(
                              child: ok,
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
}
