import 'package:flutter/material.dart';
import 'package:intrale/comp/buttons/Button.dart';
import 'package:intrale/styles/IntraleStyles.dart';

class TransparentButton extends Button {
  final String descriptionKey;
  final Future Function() onTap;

  TransparentButton({required this.descriptionKey, required this.onTap}):super(
    descriptionKey: descriptionKey,
    onTap:  onTap,
    height: 52.0, 
    width: 300.0, 
    style: Styles.TEXT_STYLES.TRANSPARENT_BUTTON, 
    decoration: Styles.DECORATION_STYLES.TRANSPARENT_BUTTON,
    padding: EdgeInsets.all(30.0) );
}
