import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:intrale/comp/styles/SansWhiteW6S13Style.dart';
import 'package:intrale/comp/styles/SansWhiteW9S20LS6Style.dart';

import 'package:intrale/comp/Language_Library/lib/easy_localization_delegate.dart';

import 'package:intrale/comp/IntraleForm.dart';
import 'package:intrale/comp/IntraleTextField.dart';
import 'package:intrale/comp/SubmitEvent.dart';
import 'package:intrale/scrn/LoginOrSignup/Confirm.dart';
import 'package:intrale/util/services/Error.dart';

import 'package:intrale/scrn/LoginOrSignup/LoginChoreographer.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginScaffold.dart';
import 'package:intrale/scrn/LoginOrSignup/Recovery.dart';

import 'package:intrale/scrn/LoginOrSignup/Signup.dart';
import 'package:intrale/scrn/LoginOrSignup/ChangePassword.dart';

import 'package:intrale/util/validation/Required.dart';

import 'package:intrale/util/services/signin/SigninRequest.dart';
import 'package:intrale/util/services/signin/SigninResponse.dart';
import 'package:intrale/util/services/signin/SigninService.dart';

import '../BottomNavigationBar.dart';

class Login extends StatefulWidget {
  @override
  _loginScreenState createState() => _loginScreenState();
}

/// Component Widget this layout UI
class _loginScreenState extends State<Login>
    with TickerProviderStateMixin
    implements SubmitEvent {
  SigninService signinService = new SigninService();

// Fields declarations
  IntraleTextField email = IntraleTextField(
      icon: Icons.email,
      password: false,
      description: 'email',
      inputType: TextInputType.emailAddress,
      validator: Required());

  IntraleTextField password = IntraleTextField(
    icon: Icons.vpn_key,
    password: true,
    description: 'password',
    inputType: TextInputType.text,
    validator: Required(),
  );

  var tap = 0;

  @override

  /// set state animation controller
  void initState() {
    super.initState();
  }

  /// Dispose animation controller
  @override
  void dispose() {
    super.dispose();
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    /*mediaQueryData.devicePixelRatio;
    mediaQueryData.size.width;
    mediaQueryData.size.height;*/

    var form = IntraleForm(submitEvent: this);

    form.child = LoginScaffold(children: <Widget>[
      Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.topCenter,
                child: Column(
                  children: <Widget>[
                    /// padding logo
                    Padding(
                        padding: EdgeInsets.only(
                            top: mediaQueryData.padding.top + 40.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/img/Logo.png"),
                          height: 70.0,
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0)),

                        /// Animation text treva shop accept from signup layout (Click to open code)
                        Hero(
                          tag: "Intrale",
                          child: Text(
                            AppLocalizations.of(context).tr('title'),
                            style: SansWhiteW9S20LS6Style(),
                          ),
                        ),
                      ],
                    ),

                    /// TextFromField Email
                    Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                    this.email,

                    /// TextFromField Password
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                    this.password,

                    /// Button Signup
                    new LoginChoreographer(
                        form: form, vsync: this, description: 'login'),

                    FlatButton(
                        padding: EdgeInsets.only(top: 20.0),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new Signup()));
                        },
                        child: Text(
                          AppLocalizations.of(context).tr('notHave'),
                          style: SansWhiteW6S13Style(),
                        )),

                    /// Button Missing Password
                    FlatButton(
                        padding: EdgeInsets.only(top: 20.0),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new Recovery()));
                        },
                        child: Text(
                          AppLocalizations.of(context).tr('missing'),
                          style: SansWhiteW6S13Style(),
                        )),

                    /// Button have verification code
                    FlatButton(
                        padding: EdgeInsets.only(top: 20.0),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new Confirm()));
                        },
                        child: Text(
                          AppLocalizations.of(context).tr('haveCode'),
                          style: SansWhiteW6S13Style(),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ]);
    return form;
  }

  @override
  Future<bool> onSubmit() async {
    try {
      SigninResponse signinResponse = await signinService.post(SigninRequest(
          username: this.email.value,
          email: this.email.value,
          password: this.password.value));

      if ((signinResponse.statusCode != 200) &&
          (signinResponse.statusCode != 426)) {
        Error error = signinResponse.errors.first;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("Ocurrio un error:" + error.code),
                  content: Text(error.description));
            });
        return false;
      }

      if (signinResponse.statusCode == 200) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        // Ingresa normalmente a la aplicacion
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => new bottomNavigationBar()));
        pref.setString('token', signinResponse.accessToken);
      } else {
        // Necesita cambio de contraseña
        Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (_, __, ___) => new ChangePassword(
                  email: this.email.value,
                  password: this.password.value,
                ),
            transitionDuration: Duration(milliseconds: 750),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return Opacity(
                opacity: animation.value,
                child: child,
              );
            }));
      }
    } catch (exception) {
      debugPrint('Login exception: ' + exception.toString());
    }

    return true;
  }
}
