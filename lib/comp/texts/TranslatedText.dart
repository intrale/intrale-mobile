import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/comp/texts/IntraleText.dart';
import 'package:intrale/styles/TextStyles.dart';

class TranslatedText extends StatelessWidget {

  final String textKey;
  final TextDirection textDirection;
  final TextStyle style;
  final TextOverflow overflow;

  TranslatedText(
      {required this.textKey,
      this.textDirection = TextDirection.ltr,
      this.style = TextStyles.DEFAULT_TEXT,
      this.overflow = TextOverflow.visible});

  @override
  Widget build(BuildContext context) {
    return IntraleText(text:FlutterI18n.translate(context, textKey), textDirection: textDirection, style: style);
  }
}