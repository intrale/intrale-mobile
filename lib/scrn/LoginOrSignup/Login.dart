
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/comp/IntraleMessageDialog.dart';
import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/buttons/SolidButton.dart';
import 'package:intrale/comp/ItlEmail.dart';
import 'package:intrale/comp/ItlFields.dart';
import 'package:intrale/comp/ItlPassword.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginOrSignupForm.dart';
import 'package:intrale/styles/IntraleStyles.dart';
import 'package:intrale/util/IntralePreferences.dart';
import 'package:intrale/util/device/DeviceInfoFactory.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/notifications/save/SaveNotificationTokenRequest.dart';
import 'package:intrale/util/services/notifications/save/SaveNotificationTokenService.dart';
import 'package:intrale/util/services/users/signin/SigninRequest.dart';
import 'package:intrale/util/services/users/signin/SigninResponse.dart';
import 'package:intrale/util/services/users/signin/SigninService.dart';
import 'package:intrale/util/validation/Required.dart';

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
          statusCode: 426, function: (response) => context.go('/changePassword', extra: changePasswordParams()))
    ]);
  }

  changePasswordParams(){
    debugPrint('email.value:' + email.value);
    debugPrint('password.value:' + password.value);
    Map<String, String> params = {
      "email": email.value,
      "password": password.value
    };
    return params;
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

            SolidButton(
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
    signinService?.post(
        request: SigninRequest(
            username: this.email.value,
            email: this.email.value,
            password: this.password.value));
  }

  void onOk(Response response) {
    SigninResponse signinResponse = response as SigninResponse;

    IntralePreferences().write(signinResponse.idToken!, signinResponse.accessToken!);

    IntralePreferences().read().then((tokens) => 
      DeviceInfoFactory().getDeviceInfo().then((deviceInfo) {
        SaveNotificationTokenRequest saveNotificationTokenRequest = 
              SaveNotificationTokenRequest.fromArgs(this.email.value, tokens.fcmToken, deviceInfo.id);    

        SaveNotificationTokenService().post(request: saveNotificationTokenRequest).then((value) =>{
          // Ingresa normalmente a la aplicacion
          context.go('/dashboard')
        });
      })
    );
  }

  void onError(Response response) {
    IntraleMessageDialog dialog = IntraleMessageDialog(titleKey: "badCredentialsTitle", contentKey: "badCredentials", buttonKey: "login_ok", 
              onPressButton: ()=>Navigator.of(context).pop());
    dialog.show(context);
  }
}