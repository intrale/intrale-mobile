import 'package:flutter/material.dart';

class IntraleForm extends StatefulWidget {
  final formKey = GlobalKey<FormState>();
  Widget child;

  IntraleForm({this.child}) {}

  @override
  State<StatefulWidget> createState() => IntraleFormState(formKey, child);

  void save() {
    formKey.currentState.save();
  }

  bool validate() {
    debugPrint('IntraleFormState onSubmit');
    bool value = formKey.currentState.validate();
    if (value) {
      save();
    }
    return value;
  }
}

class IntraleFormState extends State<IntraleForm> {
  final Widget child;
  GlobalKey<FormState> formKey;

  IntraleFormState(this.formKey, this.child) {}

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: child,
    );
  }
}
