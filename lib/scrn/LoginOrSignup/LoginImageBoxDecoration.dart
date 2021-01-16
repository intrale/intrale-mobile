import 'package:flutter/material.dart';

class LoginImageBoxDecoration extends BoxDecoration {
  LoginImageBoxDecoration()
      : super(
            image: DecorationImage(
                image: AssetImage("assets/img/loginscreenbackground.png"),
                fit: BoxFit.cover)) {}
}
