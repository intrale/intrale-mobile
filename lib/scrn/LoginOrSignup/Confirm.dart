import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intrale/comp/IntraleButton.dart';

import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/IntraleTextField.dart';

import 'package:intrale/scrn/LoginOrSignup/LoginScaffold.dart';

import 'package:intrale/scrn/LoginOrSignup/Login.dart';
import 'package:intrale/util/services/Error.dart';
import 'package:intrale/util/services/users/confirm/ConfirmRecoveryRequest.dart';
import 'package:intrale/util/services/users/confirm/ConfirmRecoveryResponse.dart';
import 'package:intrale/util/services/users/confirm/ConfirmRecoveryService.dart';
import 'package:intrale/util/validation/FormatValidation.dart';
import 'package:intrale/util/validation/MinLength.dart';

import 'package:intrale/util/validation/MultipleValidations.dart';
import 'package:intrale/util/validation/Required.dart';

class Confirm extends StatefulWidget {
  @override
  ConfirmScreenState createState() => ConfirmScreenState();
}

/// Component Widget this layout UI
class ConfirmScreenState extends IntraleState<Confirm> {
  // Texts declarations

  // Fields declarations
  IntraleTextField code;
  IntraleTextField email;
  IntraleTextField password;

  // Services declarations
  ConfirmRecoveryService confirmRecoveryService;

  // Buttons declarations
  IntraleButton submit;

  // Images declarations

  // Other Components declarations
  Column fields;

  @override
  void buttonsInitializations() {
    submit = IntraleButton(
      description: AppLocalizations.of(context).confirm_submit,
      onTap: () => onSubmit(),
    );
  }

  @override
  void fieldsInitializations() {
    code = IntraleTextField(
        icon: Icons.code,
        password: false,
        description: 'confirm.code',
        inputType: TextInputType.name,
        validator: MultipleValidations(
            validations: [Required(), MinLength(length: 3)]));

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

    password = IntraleTextField(
      icon: Icons.vpn_key,
      password: true,
      description: 'signup.password',
      inputType: TextInputType.text,
      validator: MultipleValidations(validations: [
        Required(),
        FormatValidation(
            regexp: FormatValidation.PASSWORD_PATTERN,
            message: 'Debe tener formato de contraseña.')
      ]),
    );
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
                  password,
                  Padding(padding: EdgeInsets.all(10)),
                  code,

                  submit,

                  haveUserButton,
                  notHaveButton,
                  missingButton
                ],
              ))
        ]);
  }

  @override
  void servicesInitializations() {
    confirmRecoveryService = new ConfirmRecoveryService();
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
      ConfirmRecoveryResponse recoveryResponse =
          await confirmRecoveryService.post(ConfirmRecoveryRequest(
              email: this.email.value,
              password: this.password.value,
              code: this.code.value));

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
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => new Login()));
      }
    }
  }
}
