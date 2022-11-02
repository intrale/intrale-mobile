import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/comp/IntraleMessageDialog.dart';

import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/buttons/SolidButton.dart';
import 'package:intrale/comp/ItlFields.dart';
import 'package:intrale/comp/ItlInput.dart';
import 'package:intrale/comp/ItlPassword.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginOrSignupForm.dart';
import 'package:intrale/styles/PaddingStyles.dart';

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
            mediaQueryTopPadding(40),
            header,
            PaddingStyles.EDGE_INSETS_ALL_10,
            name,
            PaddingStyles.EDGE_INSETS_ALL_10,
            familyName,
            PaddingStyles.EDGE_INSETS_ALL_10,
            newPassword,

            SolidButton(
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
    context.go('/dashboard');
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
