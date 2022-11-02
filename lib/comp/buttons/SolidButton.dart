import 'package:flutter/material.dart';
import 'package:intrale/comp/buttons/Button.dart';
import 'package:intrale/styles/DecorationStyles.dart';
import 'package:intrale/styles/TextStyles.dart';

// ignore: must_be_immutable
class SolidButton extends Button {
  final String descriptionKey;
  final Future Function() onTap;
  final TextStyle style;
  final Decoration decoration;

    SolidButton({
      required this.descriptionKey, 
      required this.onTap,
      this.style = TextStyles.SOLID_BUTTON,
      this.decoration = DecorationStyles.SOLID_BUTTON
      }):super(
    descriptionKey: descriptionKey,
    onTap:  onTap,
    height: 55.0, 
    width: 600.0, 
    style: style, 
    decoration: decoration,
    padding: EdgeInsets.all(5.0) );
}
