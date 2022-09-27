import 'package:flutter/material.dart';
import 'package:intrale/comp/buttons/Button.dart';
import 'package:intrale/styles/IntraleStyles.dart';

class LinkButton extends Button {
  final String descriptionKey;
  final void Function() onTap;

  LinkButton({required this.descriptionKey, required this.onTap}):super(
    descriptionKey: descriptionKey,
    onTap:  onTap,
    height: 52.0, 
    width: 600.0, 
    style: Styles.TEXT_STYLES.LINK_BUTTON, 
    decoration: Styles.DECORATION_STYLES.LINK_BUTTON,
    padding: EdgeInsets.all(5.0) );
}