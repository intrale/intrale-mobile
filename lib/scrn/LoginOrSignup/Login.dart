import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intrale/comp/IntraleButton.dart';
import 'package:intrale/comp/IntraleState.dart';

import 'package:intrale/util/tools.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:intrale/comp/IntraleTextField.dart';
import 'package:intrale/util/services/Error.dart';

import 'package:intrale/scrn/LoginOrSignup/LoginScaffold.dart';

import 'package:intrale/scrn/LoginOrSignup/ChangePassword.dart';

import 'package:intrale/util/validation/Required.dart';

import 'package:intrale/util/services/users/signin/SigninRequest.dart';
import 'package:intrale/util/services/users/signin/SigninService.dart';

import 'package:intrale/scrn/BottomNavigationBar.dart';

class Login extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

/// Component Widget this layout UI
class LoginScreenState extends IntraleState<Login> {
  // Texts declarations
  Text ok;
  Text badCredentials;

  // Fields declarations
  IntraleTextField email;
  IntraleTextField password;

  // Services declarations
  SigninService signinService = new SigninService();

  // Buttons declarations
  IntraleButton submit;

  // Images declarations

  // Other Components declarations
  Column fields;

  @override
  void buttonsInitializations() {
    submit = IntraleButton(
      description: AppLocalizations.of(context).login_submit,
      onTap: () => onSubmit(),
    );
  }

  @override
  void fieldsInitializations() {
    email = IntraleTextField(
        icon: Icons.email,
        password: false,
        description: AppLocalizations.of(context).login_email,
        inputType: TextInputType.emailAddress,
        validator: Required());

    password = IntraleTextField(
      icon: Icons.vpn_key,
      password: true,
      description: AppLocalizations.of(context).login_password,
      inputType: TextInputType.text,
      validator: Required(),
    );
  }

  @override
  void imagesInitializations() {}

  @override
  void othersInitializations() {
    fields = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: AlignmentDirectional.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  /// padding logo
                  Padding(
                      padding: EdgeInsets.only(
                          top: mediaQueryData.padding.top + 40.0)),
                  header,
                  Padding(padding: EdgeInsets.all(10)),
                  email,
                  Padding(padding: EdgeInsets.all(10)),
                  password,

                  submit,

                  notHaveButton,
                  missingButton,
                  haveCodeButton,
                ],
              ))
        ]);
  }

  @override
  void servicesInitializations() {
    signinService = new SigninService();
  }

  @override
  void textsInitializations() {
    ok = Text(AppLocalizations.of(context).login_ok);
    badCredentials = Text(AppLocalizations.of(context).login_badCredentials);
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    return new Form(
        key: formKey,
        child: LoginScaffold(children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              fields,
            ],
          ),
        ]));
  }

  onSubmit() {
    debugPrint('Login onSubmit');
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      signinService
          .post(SigninRequest(
              username: this.email.value,
              email: this.email.value,
              password: this.password.value))
          .then((signinResponse) {
        if (signinResponse.statusCode == 200) {
          SharedPreferences.getInstance().then((pref) {
            pref.setString('accessToken', signinResponse.accessToken);
            pref.setString('idToken', signinResponse.idToken);
            // Ingresa normalmente a la aplicacion
            redirectTo(context, new bottomNavigationBar());
          });
        } else if (signinResponse.statusCode == 426) {
          // Necesita cambio de contraseña
          redirectTo(
              context,
              new ChangePassword(
                email: this.email.value,
                password: this.password.value,
              ));
        } else {
          Error error = signinResponse.errors.first;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: badCredentials,
                /*content: Text(error.code + " - " + error.description),*/
                actions: [
                  TextButton(
                    child: ok,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      });
    }
  }
}
