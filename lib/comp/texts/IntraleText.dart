import 'package:flutter/material.dart';
import 'package:intrale/styles/TextStyles.dart';

class IntraleText extends StatelessWidget {
  
  final String text;
  final TextDirection textDirection;
  final TextStyle style;
  final TextOverflow overflow; 

  IntraleText(
      {required this.text,
      this.textDirection = TextDirection.ltr,
      this.style = TextStyles.DEFAULT_TEXT,
      this.overflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        textDirection: textDirection, 
        style: style,
        overflow: overflow,);
  }
}
