import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/comp/ItlText.dart';

class ItlRedirectButton extends StatelessWidget {
  String textKey;
  String path;

  ItlRedirectButton({required this.textKey, required this.path}) {}

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.go(path);
        },
        child: ItlText(textKey: textKey));
  }
}
