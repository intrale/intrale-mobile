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

}