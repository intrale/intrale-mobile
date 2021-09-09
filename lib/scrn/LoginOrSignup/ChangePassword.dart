import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intrale/comp/IntraleButton.dart';

import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/IntraleTextField.dart';

import 'package:intrale/scrn/LoginOrSignup/LoginScaffold.dart';

import 'package:intrale/util/validation/Required.dart';
import 'package:intrale/util/services/Error.dart';

import 'package:intrale/util/services/users/signin/SigninRequest.dart';
import 'package:intrale/util/services/users/signin/SigninResponse.dart';
import 'package:intrale/util/services/users/signin/SigninService.dart';

import 'package:intrale/scrn/BottomNavigationBar.dart';

class ChangePassword extends StatefulWidget {
  String email;
  String password;

  ChangePassword({this.email, this.password}) {}

  @override
  ChangePasswordState createState() =>
      ChangePasswordState(email: email, password: password);
}

/// Component Widget this layout UI
class ChangePasswordState extends IntraleState<ChangePassword> {
  // Texts declarations

  // Fields declarations
  IntraleTextField name;
  IntraleTextField familyName;
  IntraleTextField newPassword;

  // Services declarations
  SigninService signinService;

  // Buttons declarations
  IntraleButton submit;

  // Images declarations

  // Other Components declarations
  Column fields;
  String email;
  String password;

  @override
  void buttonsInitializations() {
    submit = IntraleButton(
      description: AppLocalizations.of(context).changePassword_submit,
      onTap: () => onSubmit(),
    );
  }

  @override
  void fieldsInitializations() {}

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
                  Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                  this.name,

                  Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                  this.familyName,
                  Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                  this.newPassword,
                  Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                  submit,
                ],
              ))
        ]);
  }

  @override
  void servicesInitializations() {
    signinService = new SigninService();
  }

  @override
  void textsInitializations() {
    name = IntraleTextField(
      icon: Icons.person,
      password: false,
      description: 'changePassword.name',
      inputType: TextInputType.text,
      validator: Required(),
    );

    familyName = IntraleTextField(
      icon: Icons.vpn_key,
      password: false,
      description: 'changePassword.familyName',
      inputType: TextInputType.text,
      validator: Required(),
    );

    newPassword = IntraleTextField(
      icon: Icons.vpn_key,
      password: true,
      description: 'changePassword.password',
      inputType: TextInputType.text,
      validator: Required(),
    );
  }

  ChangePasswordState({this.email, this.password}) {}

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
    debugPrint("INTRALE: onSubmit =>" + this.password);
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      SigninResponse signinResponse = await signinService.post(SigninRequest(
          name: this.name.value,
          familyName: this.familyName.value,
          username: this.email,
          email: this.email,
          password: this.password,
          newPassword: this.newPassword.value));

      if (signinResponse.statusCode != 200) {
        Error error = signinResponse.errors.first;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("Ocurrio un error:" + error.code),
                  content: Text(error.description));
            });
      } else {
        // Ingresa normalmente a la aplicacion
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => new bottomNavigationBar()));
      }
    }
  }
}
