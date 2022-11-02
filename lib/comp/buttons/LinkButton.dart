import 'package:flutter/material.dart';
import 'package:intrale/comp/buttons/Button.dart';
import 'package:intrale/styles/DecorationStyles.dart';
import 'package:intrale/styles/TextStyles.dart';

// ignore: must_be_immutable
class LinkButton extends Button {
  final String descriptionKey;
  final Future Function() onTap;

  LinkButton({required this.descriptionKey, required this.onTap}):super(
    descriptionKey: descriptionKey,
    onTap:  onTap,
    height: 52.0, 
    width: 600.0, 
    style: TextStyles.LINK_BUTTON, 
    decoration: DecorationStyles.LINK_BUTTON,
    padding: EdgeInsets.all(5.0) );
}