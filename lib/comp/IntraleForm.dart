import 'package:flutter/material.dart';

import 'package:intrale/comp/Language_Library/lib/easy_localization_delegate.dart';
import 'package:intrale/comp/Language_Library/lib/easy_localization_provider.dart';
import 'package:intrale/comp/SubmitEvent.dart';

class IntraleForm extends StatefulWidget implements SubmitEvent {
  Widget child;
  final formKey = GlobalKey<FormState>();
  SubmitEvent submitEvent;

  IntraleForm({this.child, this.submitEvent}) {}

  @override
  State<StatefulWidget> createState() {
    return IntraleFormState(child, formKey);
  }

  @override
  Future<bool> onSubmit() {
    formKey.currentState.save();
    return submitEvent.onSubmit();
  }
}

class IntraleFormState extends State<IntraleForm> {
  final Widget child;
  final formKey;

  IntraleFormState(this.child, this.formKey) {}

  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return Form(
      key: formKey,
      child: EasyLocalizationProvider(data: data, child: child),
    );
  }
}
