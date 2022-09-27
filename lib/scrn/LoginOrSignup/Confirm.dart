import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/buttons/SolidButton.dart';
import 'package:intrale/comp/ItlEmail.dart';
import 'package:intrale/comp/ItlFields.dart';
import 'package:intrale/comp/ItlInput.dart';
import 'package:intrale/comp/ItlPassword.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginOrSignupForm.dart';
import 'package:intrale/styles/IntraleStyles.dart';
import 'package:intrale/util/services/Error.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/users/confirm/ConfirmRecoveryRequest.dart';
import 'package:intrale/util/services/users/confirm/ConfirmRecoveryResponse.dart';
import 'package:intrale/util/services/users/confirm/ConfirmRecoveryService.dart';
import 'package:intrale/util/validation/MinLength.dart';
import 'package:intrale/util/validation/MultipleValidations.dart';
import 'package:intrale/util/validation/Required.dart';

class Confirm extends StatefulWidget {
  @override
  ConfirmScreenState createState() => ConfirmScreenState();
}

/// Component Widget this layout UI
class ConfirmScreenState extends IntraleState<Confirm> {
  ItlInput code = ItlInput(
      descriptionKey: "confirm_code",
      icon: Icons.code,
      validator:
          MultipleValidations(validations: [Required(), MinLength(length: 3)]));

  ItlEmail email = ItlEmail(
      descriptionKey: "confirm_email",
      validator:
          MultipleValidations(validations: [Required(), MinLength(length: 3)]));

  ItlPassword password =
      ItlPassword(descriptionKey: "confirm_password", validator: Required());

  ConfirmRecoveryService? confirmRecoveryService;

  ConfirmScreenState() {
    confirmRecoveryService =
        ConfirmRecoveryService(handlers: [okHandler!, errorHandler!]);
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    return LoginOrSignupForm(
        formKey: formKey,
        body: ItlFields(
          children: <Widget>[
            /// padding logo
            mediaQueryTopPadding(40),
            header,
            Styles.PADDING_STYLES.EDGE_INSETS_ALL_10,
            email,
            Styles.PADDING_STYLES.EDGE_INSETS_ALL_10,
            password,
            Styles.PADDING_STYLES.EDGE_INSETS_ALL_10,
            code,

            SolidButton(
              descriptionKey: "confirm_submit",
              onTap: () => onSubmit(),
            ),

            haveUserButton,
            notHaveButton,
            missingButton 
          ],
        ));
  }

  @override
  onValidSubmit() async {
    confirmRecoveryService?.post(
        request: ConfirmRecoveryRequest(
            email: this.email.value,
            password: this.password.value,
            code: this.code.value));
  }

  void onOk(Response response) {
    context.go('/login');
  }

  void onError(Response response) {
    //TODO: Aplicar show dialgo estandar de intrale
    ConfirmRecoveryResponse recoveryResponse =
        response as ConfirmRecoveryResponse;
    Error error = recoveryResponse.errors!.first;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Ocurrio un error:" + (error.code)),
              content: Text((error.description)));
        });
  }
}
