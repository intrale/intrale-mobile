import 'package:flutter/material.dart';
import 'package:intrale/comp/buttons/SolidButton.dart';
import 'package:intrale/comp/texts/TranslatedText.dart';
import 'package:intrale/styles/TextStyles.dart';

class IntraleMessageDialog extends StatelessWidget {

  final String titleKey;
  final String contentKey;
  final String buttonKey;
  final Future Function() onPressButton;

  IntraleMessageDialog({required this.titleKey, required this.contentKey, required this.buttonKey, required this.onPressButton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
              title: TranslatedText(textKey: titleKey, style: TextStyles.ALERT_DIALOG_TITLE),
              content: TranslatedText(textKey: contentKey, style: TextStyles.ALERT_DIALOG_BODY), 
              actions:[
                SolidButton(descriptionKey: buttonKey, onTap: onPressButton)
              ]
            );
  }

  void show(BuildContext context){
    showDialog(
          context: context,
          builder: (BuildContext context) {
            return this;
          });
  }
  
}