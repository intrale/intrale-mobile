import 'package:flutter/material.dart';
import 'package:intrale/comp/ItlConfirmRedirectButton.dart';
import 'package:intrale/comp/ItlHeader.dart';
import 'package:intrale/comp/ItlLoginRedirectButton.dart';
import 'package:intrale/comp/ItlLogo.dart';
import 'package:intrale/comp/ItlRecoveryRedirectButton.dart';
import 'package:intrale/comp/ItlSignupRedirectButton.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/StatusCodes.dart';

abstract class IntraleState<T extends StatefulWidget> extends State<T>
    with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  static const Padding DEFAULT_PADDING = Padding(padding: EdgeInsets.all(10));

  // Buttons declarations
  ItlSignupRedirectButton notHaveButton = ItlSignupRedirectButton();
  ItlRecoveryRedirectButton missingButton = ItlRecoveryRedirectButton();
  ItlConfirmRedirectButton haveCodeButton = ItlConfirmRedirectButton();
  ItlLoginRedirectButton haveUserButton = ItlLoginRedirectButton();

  // Images declarations
  ItlLogo logo = ItlLogo();

  // Other Components declarations
  ItlHeader header = ItlHeader();
  MediaQueryData mediaQueryData = new MediaQueryData();

  Handler? okHandler;
  Handler? errorHandler;

  IntraleState() {
    okHandler = Handler(
        statusCode: STATUS_CODE_OK, function: (response) => onOk(response));

    errorHandler =
        Handler(statusCode: 0, function: (response) => onError(response));
  }

  void onOk(Response response) {}
  void onError(Response response) {}

  onSubmit() {
    bool valid = formKey.currentState?.validate() ?? false;
    if (valid) {
      formKey.currentState?.save();
      onValidSubmit();
    }
  }

  onValidSubmit() {}
}
