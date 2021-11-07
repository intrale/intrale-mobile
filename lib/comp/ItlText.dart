import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/const/TextStyleConst.dart';

class ItlText extends StatelessWidget {
  String textKey;
  TextDirection textDirection;
  TextStyle style;

  ItlText(
      {@required this.textKey,
      this.textDirection = TextDirection.ltr,
      this.style = DEFAULT_TEXT}) {}

  @override
  Widget build(BuildContext context) {
    return Text(FlutterI18n.translate(context, textKey),
        textDirection: textDirection, style: style);
  }
}
