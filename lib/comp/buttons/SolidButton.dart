import 'package:flutter/material.dart';
import 'package:intrale/comp/buttons/Button.dart';
import 'package:intrale/styles/IntraleStyles.dart';

class SolidButton extends Button {
  final String descriptionKey;
  final void Function() onTap;

    SolidButton({required this.descriptionKey, required this.onTap}):super(
    descriptionKey: descriptionKey,
    onTap:  onTap,
    height: 55.0, 
    width: 600.0, 
    style: Styles.TEXT_STYLES.SOLID_BUTTON, 
    decoration: Styles.DECORATION_STYLES.SOLID_BUTTON,
    padding: EdgeInsets.all(30.0) );
}
