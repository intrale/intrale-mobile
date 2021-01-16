import 'package:flutter/material.dart';

import 'package:intrale/comp/Language_Library/lib/easy_localization_delegate.dart';

import 'package:intrale/util/validation/Validator.dart';
import 'package:intrale/comp/TapEvent.dart';

/// textfromfield custom class
class IntraleTextField extends StatefulWidget {
  final bool password;
  final String description;
  final IconData icon;
  final TextInputType inputType;
  final Validator validator;
  final _textKey = GlobalKey<FormState>();
  final TapEvent tapEvent;
  var value;

  IntraleTextField(
      {this.description,
      this.icon,
      this.inputType,
      this.password,
      this.validator,
      this.tapEvent,
      this.value});

  onSaved(var value) {
    this.value = value;
  }

  @override
  State<StatefulWidget> createState() {
    return IntraleTextFieldState(
        description: this.description,
        icon: this.icon,
        inputType: this.inputType,
        password: this.password,
        validator: this.validator,
        tapEvent: this.tapEvent,
        intraleTextField: this);
  }
}

class IntraleTextFieldState extends State<IntraleTextField> {
  final bool password;
  final String description;
  final IconData icon;
  final TextInputType inputType;
  final Validator validator;
  final _textKey = GlobalKey<FormState>();
  final TapEvent tapEvent;
  final IntraleTextField intraleTextField;

  IntraleTextFieldState(
      {this.description,
      this.icon,
      this.inputType,
      this.password,
      this.validator,
      this.tapEvent,
      this.intraleTextField});

  @override
  Widget build(BuildContext context) {
    debugPrint('IntraleTextField build');
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
              onTap: () {
                tapEvent.onTap();
              },
              onSaved: (newValue) {
                setState(() {
                  intraleTextField.onSaved(newValue);
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
                  labelText: AppLocalizations.of(context).tr(description),
                  icon: Icon(
                    icon,
                    color: Colors.black38,
                  ),
                  labelStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Sans',
                      letterSpacing: 0.3,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600)),
              keyboardType: inputType),
        ),
      ),
    );
  }
}
