import 'package:flutter/material.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginScaffold.dart';

class LoginOrSignupForm extends Form {
  LoginOrSignupForm({Key formKey, Widget body})
      : super(
            key: formKey,
            child: LoginScaffold(children: <Widget>[
              Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[body],
              ),
            ]));
}
