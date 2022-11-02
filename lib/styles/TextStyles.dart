import 'package:flutter/material.dart';
import 'package:intrale/styles/IntraleTextStyle.dart';

class TextStyles {

  const TextStyles();

  static const IntraleTextStyle DEFAULT_TEXT = IntraleTextStyle(
    color: Colors.white,
    fontSize: 13.0,
    fontWeight: FontWeight.w600,
  );

  static const IntraleTextStyle ALERT_DIALOG_TITLE = IntraleTextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w600
  );

  static const IntraleTextStyle ALERT_DIALOG_BODY = IntraleTextStyle();

  static const IntraleTextStyle WELCOME_PREFIX = IntraleTextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w200,
    fontSize: 19.0,
    decoration: TextDecoration.none);

  static const IntraleTextStyle WELCOME_BUSINESS_NAME = IntraleTextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 35.0,
    letterSpacing: 0.4,
    decoration: TextDecoration.none);

  static const IntraleTextStyle HINT = IntraleTextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w200,
    fontSize: 17.0,
    letterSpacing: 1.3);

  static const IntraleTextStyle TITLE = IntraleTextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 20.0,
    letterSpacing: 0.6);

  static const IntraleTextStyle INPUT_FIELD = IntraleTextStyle(
    color: Colors.black38,
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
    letterSpacing: 0.3);  

  static const IntraleTextStyle SOLID_BUTTON = IntraleTextStyle(
    color: Colors.white,
    letterSpacing: 0.2,
    fontSize: 18.0,
    fontWeight: FontWeight.w800);

  static const IntraleTextStyle TRANSPARENT_BUTTON = IntraleTextStyle(
    color: Colors.white,
    fontSize: 19.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5);

  static const IntraleTextStyle LINK_BUTTON = IntraleTextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2);

  static const IntraleTextStyle CHOSE_LOGIN_OR_SIGNUP_SCREEN_OR_SKIP = IntraleTextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w100);

  static const IntraleTextStyle CHOSE_LOGIN_OR_SIGNUP_SCREEN_BUTTON = IntraleTextStyle(
    color: Colors.white,
    fontSize: 19.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5);

  static const IntraleTextStyle DASHBOARD_GRID_PRICE = IntraleTextStyle(
      fontSize: 14.0
  );

  static const IntraleTextStyle DASHBOARD_GRID_RATING = IntraleTextStyle(
    fontSize: 12.0
  );

  static const IntraleTextStyle DASHBOARD_GRID_TITLE = IntraleTextStyle(
    letterSpacing: 0.5,
    fontSize: 13.0);

  static const IntraleTextStyle APPBAR_CIRCLE_AVATAR = IntraleTextStyle(
    color: Colors.white,
    fontSize: 13.0);

}