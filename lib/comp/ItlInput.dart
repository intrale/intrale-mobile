import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/const/TextStyleConst.dart';

import 'package:intrale/util/validation/Validator.dart';
import 'package:intrale/comp/TapEvent.dart';

/// textfromfield custom class
class ItlInput extends StatefulWidget {
  final bool password;
  final String descriptionKey;
  final IconData icon;
  final TextInputType inputType;
  final Validator validator;
  //final TapEvent tapEvent;
  var value;

  ItlInput(
      {required this.descriptionKey,
      this.icon = Icons.drafts,
      this.inputType = TextInputType.text,
      this.password = false,
      this.validator = const Validator(),
      /*this.tapEvent,*/
      this.value});

  onSaved(var value) {
    debugPrint("onSaved:" + value);
    this.value = value;
  }

  @override
  State<StatefulWidget> createState() {
    return ItlInputState(
        descriptionKey: this.descriptionKey,
        icon: this.icon,
        inputType: this.inputType,
        password: this.password,
        validator: this.validator,
        itlInput: this);
  }
}

class ItlInputState extends State<ItlInput> {
  final bool password;
  final String descriptionKey;
  final IconData icon;
  final TextInputType inputType;
  final Validator validator;
  final _textKey = GlobalKey<FormState>();
  final ItlInput itlInput;

  ItlInputState(
      {required this.descriptionKey,
      this.icon = Icons.drafts,
      this.inputType = TextInputType.text,
      this.password = false,
      this.validator = const Validator(),
      required this.itlInput});

  @override
  Widget build(BuildContext context) {
    this.validator.sharingContext(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: TextFormField(
              onSaved: (newValue) {
                setState(() {
                  debugPrint("setState: onSaved");
                  itlInput.onSaved(newValue);
                });
              },
              key: _textKey,
              validator: (value) {
                if (validator != null) {
                  return validator.validate(value);
                }
                return null;
              },
              obscureText: password,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: FlutterI18n.translate(context, descriptionKey),
                  icon: Icon(
                    icon,
                    color: Colors.black38,
                  ),
                  labelStyle: INTRALE_TEXT_FIELD),
              keyboardType: inputType),
        ),
      ),
    );
  }
}
