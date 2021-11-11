import 'package:flutter/material.dart';
import 'package:intrale/comp/ItlText.dart';
import 'package:intrale/util/tools.dart';

class ItlRedirectButton extends StatelessWidget {
  String textKey;
  Widget widget;

  ItlRedirectButton({required this.textKey, required this.widget}) {}

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          redirectTo(context, widget);
        },
        child: ItlText(textKey: textKey));
  }
}
