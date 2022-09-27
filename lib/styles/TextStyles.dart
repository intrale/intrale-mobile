import 'package:flutter/material.dart';
import 'package:intrale/styles/IntraleTextStyle.dart';

class TextStyles {
  IntraleTextStyle ALERT_DIALOG_TITLE = IntraleTextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w600
  );
  IntraleTextStyle ALERT_DIALOG_BODY = IntraleTextStyle();

  IntraleTextStyle WELCOME_PREFIX = IntraleTextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w200,
    fontSize: 19.0,
    decoration: TextDecoration.none);

  IntraleTextStyle WELCOME_BUSINESS_NAME = IntraleTextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 35.0,
    letterSpacing: 0.4,
    decoration: TextDecoration.none);

  IntraleTextStyle SOLID_BUTTON = IntraleTextStyle(
    color: Colors.white,
    letterSpacing: 0.2,
    fontSize: 18.0,
    fontWeight: FontWeight.w800);

  IntraleTextStyle TRANSPARENT_BUTTON = IntraleTextStyle(
    color: Colors.white,
    fontSize: 19.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5);

  IntraleTextStyle LINK_BUTTON = IntraleTextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2);


  IntraleTextStyle CHOSE_LOGIN_OR_SIGNUP_SCREEN_OR_SKIP = IntraleTextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w100);

  IntraleTextStyle CHOSE_LOGIN_OR_SIGNUP_SCREEN_BUTTON = IntraleTextStyle(
    color: Colors.white,
    fontSize: 19.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5);


}