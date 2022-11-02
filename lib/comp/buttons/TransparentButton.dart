import 'package:flutter/material.dart';
import 'package:intrale/comp/buttons/Button.dart';
import 'package:intrale/styles/DecorationStyles.dart';
import 'package:intrale/styles/TextStyles.dart';

// ignore: must_be_immutable
class TransparentButton extends Button {
  final String descriptionKey;
  final Future Function() onTap;

  TransparentButton({required this.descriptionKey, required this.onTap}):super(
    descriptionKey: descriptionKey,
    onTap:  onTap,
    height: 52.0, 
    width: 300.0, 
    style: TextStyles.TRANSPARENT_BUTTON, 
    decoration: DecorationStyles.TRANSPARENT_BUTTON,
    padding: EdgeInsets.all(5.0) );
}
