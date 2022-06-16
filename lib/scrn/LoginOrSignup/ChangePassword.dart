import 'package:flutter/material.dart';

import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/ItlButton.dart';
import 'package:intrale/comp/ItlFields.dart';
import 'package:intrale/comp/ItlInput.dart';
import 'package:intrale/comp/ItlPassword.dart';
import 'package:intrale/scrn/Dashboard.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginOrSignupForm.dart';

import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/validation/FormatValidation.dart';
import 'package:intrale/util/validation/MultipleValidations.dart';

import 'package:intrale/util/validation/Required.dart';
import 'package:intrale/util/services/Error.dart';

import 'package:intrale/util/services/users/signin/SigninRequest.dart';
import 'package:intrale/util/services/users/signin/SigninService.dart';

class ChangePassword extends StatefulWidget {
  String email;
  String password;

  ChangePassword({required this.email, required this.password}) {}

  @override
  ChangePasswordState createState() =>
      ChangePasswordState(email: email, password: password);
}

/// Component Widget this layout UI
class ChangePasswordState extends IntraleState<ChangePassword> {
  String email;
  String password;

  ItlInput name = new ItlInput(
      descriptionKey: "changePassword_name",
      icon: Icons.person,
      inputType: TextInputType.name,
      validator: Required());
  ItlInput familyName = new ItlInput(
      descriptionKey: "changePassword_familyName",
      icon: Icons.person,
      inputType: TextInputType.name,
      validator: Required());
  ItlInput newPassword = new ItlPassword(
      descriptionKey: "changePassword_newPassword",
      validator: MultipleValidations(validations: [
        Required(),
        FormatValidation(
            messageKey: "passwordFormat",
            regexp: FormatValidation.PASSWORD_PATTERN)
      ]));

  SigninService? signinService;

  ChangePasswordState({required this.email, required this.password}) : super() {
    signinService = new SigninService(handlers: [okHandler!, errorHandler!]);
  }

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
            name,
            IntraleState.DEFAULT_PADDING,
            familyName,
            IntraleState.DEFAULT_PADDING,
            newPassword,

            ItlButton(
              descriptionKey: "login_submit",
              onTap: () => onSubmit(),
            ),
          ],
        ));
  }

  @override
  onValidSubmit() {
    signinService?.post(
        request: SigninRequest(
            name: this.name.value,
            familyName: this.familyName.value,
            username: this.email,
            email: this.email,
            password: this.password,
            newPassword: this.newPassword.value));
  }

  void onOk(Response response) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => Dashboard()));
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
