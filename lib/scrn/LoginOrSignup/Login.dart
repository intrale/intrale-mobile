import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/ItlButton.dart';
import 'package:intrale/comp/ItlEmail.dart';
import 'package:intrale/comp/ItlFields.dart';
import 'package:intrale/comp/ItlPassword.dart';
import 'package:intrale/scrn/Dashboard.dart';
import 'package:intrale/scrn/LoginOrSignup/ChangePassword.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginOrSignupForm.dart';
import 'package:intrale/util/device/DeviceInfoFactory.dart';
import 'package:intrale/util/services/Error.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/notifications/save/SaveNotificationTokenRequest.dart';
import 'package:intrale/util/services/notifications/save/SaveNotificationTokenService.dart';
import 'package:intrale/util/services/users/signin/SigninRequest.dart';
import 'package:intrale/util/services/users/signin/SigninResponse.dart';
import 'package:intrale/util/services/users/signin/SigninService.dart';
import 'package:intrale/util/tools.dart';
import 'package:intrale/util/validation/Required.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

/// Component Widget this layout UI
class LoginScreenState extends IntraleState<Login> {

  ItlEmail email = ItlEmail(
    descriptionKey: "login_email",
    validator: Required(),
  );

  ItlPassword password =
      ItlPassword(descriptionKey: "login_password", validator: Required());

  SigninService? signinService;

  LoginScreenState() : super() {
    signinService = new SigninService(handlers: [
      okHandler!,
      errorHandler!,
      Handler(
          statusCode: 426, function: (response) => onChangePassword(response))
    ]);
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    return LoginOrSignupForm(
        formKey: formKey,
        body: ItlFields(
          children: <Widget>[
            /// padding logo
            Padding(
                padding:
                    EdgeInsets.only(top: mediaQueryData.padding.top + 40.0)),
            header,
            IntraleState.DEFAULT_PADDING,
            email,
            IntraleState.DEFAULT_PADDING,
            password,

            ItlButton(
              descriptionKey: "login_submit",
              onTap: () => onSubmit(),
            ),

            notHaveButton,
            missingButton,
            haveCodeButton,
          ],
        ));
  }

  @override
  onValidSubmit() {
    debugPrint('Login onSubmit');
    signinService?.post(
        request: SigninRequest(
            username: this.email.value,
            email: this.email.value,
            password: this.password.value));
  }

  void onOk(Response response) {
    SigninResponse signinResponse = response as SigninResponse;
    SharedPreferences.getInstance().then((pref) {
      pref.setString('accessToken', signinResponse.accessToken!);
      pref.setString('idToken', signinResponse.idToken!);

      DeviceInfoFactory().getDeviceInfo().then((deviceInfo) {
        print("onOk:" + deviceInfo.toString());
        SaveNotificationTokenRequest saveNotificationTokenRequest = SaveNotificationTokenRequest();    
        saveNotificationTokenRequest.email = this.email.value;
        saveNotificationTokenRequest.device = deviceInfo.id;
        saveNotificationTokenRequest.token = pref.getString('fcmToken');

        SaveNotificationTokenService().post(request: saveNotificationTokenRequest).then((value) =>{
          // Ingresa normalmente a la aplicacion
          redirectTo(context, Dashboard())
        });

      } );
      
    });
  }

  void onError(Response response) {
    Error error = response.errors!.first;
    showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return AlertDialog(
          title: Text(FlutterI18n.translate(context, "login_badCredentials")),
          actions: [
            TextButton(
              child: Text(FlutterI18n.translate(context, "login_ok")),
              onPressed: () {
                Navigator.of(buildContext).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onChangePassword(Response response) {
    // Necesita cambio de contraseña
    redirectTo(
        context,
        new ChangePassword(
          email: this.email.value,
          password: this.password.value,
        ));
  }
}
