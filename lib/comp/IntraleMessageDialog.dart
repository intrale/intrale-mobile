import 'package:flutter/material.dart';
import 'package:intrale/comp/buttons/SolidButton.dart';
import 'package:intrale/comp/ItlText.dart';
import 'package:intrale/styles/IntraleStyles.dart';

class IntraleMessageDialog extends StatelessWidget {

  String titleKey;
  String contentKey;
  String buttonKey;
  void Function() onPressButton;

  IntraleMessageDialog({required this.titleKey, required this.contentKey, required this.buttonKey, required this.onPressButton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
                                title: ItlText(textKey: titleKey, style: Styles.TEXT_STYLES.ALERT_DIALOG_TITLE),
                                content: ItlText(textKey: contentKey, style: Styles.TEXT_STYLES.ALERT_DIALOG_BODY), 
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