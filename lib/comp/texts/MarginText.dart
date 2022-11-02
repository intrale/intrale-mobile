
import 'package:flutter/material.dart';
import 'package:intrale/comp/Margin.dart';
import 'package:intrale/comp/texts/IntraleText.dart';
import 'package:intrale/styles/TextStyles.dart';

class MarginText extends StatelessWidget {
  final String text;
  final TextDirection textDirection;
  final TextStyle style;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final TextOverflow overflow; 

  MarginText(
      {required this.text,
      this.textDirection = TextDirection.ltr,
      this.style = TextStyles.DEFAULT_TEXT,
      this.left = 0,
      this.right = 0,
      this.top = 0,
      this.bottom = 0,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Margin(
        child: IntraleText(
          text: text, 
          style:style, 
          textDirection: textDirection,
          overflow: overflow,),
        left: left, right: right, top: top, bottom: bottom,
    );
  }
  
}