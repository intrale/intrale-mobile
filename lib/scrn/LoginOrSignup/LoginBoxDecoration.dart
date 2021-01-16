import 'package:flutter/material.dart';

class LoginBoxDecoration extends BoxDecoration {
  LoginBoxDecoration()
      : super(
            gradient: LinearGradient(
          colors: [Color.fromRGBO(0, 0, 0, 0.0), Color.fromRGBO(0, 0, 0, 0.3)],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        )) {}
}
