import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intrale/comp/IntraleButton.dart';

import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/IntraleTextField.dart';
import 'package:intrale/scrn/LoginOrSignup/Confirm.dart';

import 'package:intrale/scrn/LoginOrSignup/LoginScaffold.dart';

import 'package:intrale/util/services/Error.dart';
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
  // Texts declarations
  Text ok;

  // Fields declarations
  IntraleTextField email;

  // Services declarations
  RecoveryService recoveryService;

  // Buttons declarations
  IntraleButton submit;

  // Images declarations

  // Other Components declarations
  Column fields;

  @override
  void buttonsInitializations() {
    submit = IntraleButton(
      description: AppLocalizations.of(context).recovery_submit,
      onTap: () => onSubmit(),
    );
  }

  @override
  void fieldsInitializations() {
    email = IntraleTextField(
        icon: Icons.email,
        password: false,
        description: 'signup.email',
        inputType: TextInputType.emailAddress,
        validator: MultipleValidations(validations: [
          Required(),
          FormatValidation(
              regexp: FormatValidation.EMAIL_PATTERN,
              message: 'Debe tener formato de email.')
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
                  Padding(padding: EdgeInsets.all(10)),

                  submit,

                  haveUserButton,
                  notHaveButton,
                  haveCodeButton,
                ],
              ))
        ]);
  }

  @override
  void servicesInitializations() {
    recoveryService = new RecoveryService();
  }

  @override
  void textsInitializations() {}

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
      RecoveryResponse recoveryResponse =
          await recoveryService.post(SignupRequest(email: this.email.value));

      if (recoveryResponse.statusCode != 200) {
        Error error = recoveryResponse.errors.first;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("Ocurrio un error:" + error.code),
                  content: Text(error.description));
            });
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => new Confirm()));
      }
    }
  }
}
