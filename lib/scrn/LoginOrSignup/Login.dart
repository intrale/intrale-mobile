import 'dart:async';

import 'package:http/http.dart' as HTTP;

import 'package:flutter/material.dart';

import 'package:intrale/comp/styles/SansWhiteW6S13Style.dart';
import 'package:intrale/comp/styles/SansWhiteW9S17LS2Style.dart';
import 'package:intrale/comp/styles/SansWhiteW9S20LS6Style.dart';

import 'package:intrale/comp/Language_Library/lib/easy_localization_delegate.dart';

import 'package:intrale/comp/IntraleForm.dart';
import 'package:intrale/comp/IntraleTextField.dart';
import 'package:intrale/comp/FacebookButton.dart';
import 'package:intrale/comp/GoogleButton.dart';
import 'package:intrale/comp/SubmitEvent.dart';

import 'package:intrale/scrn/LoginOrSignup/LoginChoreographer.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginScaffold.dart';

import 'package:intrale/scrn/LoginOrSignup/Signup.dart';
import 'package:intrale/scrn/LoginOrSignup/ChangePassword.dart';

import 'package:intrale/util/validation/Required.dart';

import 'package:intrale/util/services/signin/SigninRequest.dart';
import 'package:intrale/util/services/signin/SigninResponse.dart';
import 'package:intrale/util/services/signin/SigninService.dart';

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

                    /// ButtonCustomFacebook
                    Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
                    FacebookButton(),

                    /// ButtonCustomGoogle
                    Padding(padding: EdgeInsets.symmetric(vertical: 7.0)),
                    GoogleButton(),

                    /// Set Text
                    Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                    Text(
                      AppLocalizations.of(context).tr('or'),
                      style: SansWhiteW9S17LS2Style(),
                    ),

                    /// TextFromField Email
                    Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                    this.email,

                    /// TextFromField Password
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                    this.password,

                    /// Button Signup
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
                    Padding(
                      padding: EdgeInsets.only(
                          top: mediaQueryData.padding.top + 100.0, bottom: 0.0),
                    )
                  ],
                ),
              ),
            ],
          ),
          new LoginChoreographer(form: form, vsync: this, description: 'login'),
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

      if (signinResponse.statusCode != 200) {
        return false;
      }
    } catch (exception) {
      debugPrint('Login exception: ' + exception.toString());
    }
    Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (_, __, ___) => new ChangePassword(),
        transitionDuration: Duration(milliseconds: 750),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return Opacity(
            opacity: animation.value,
            child: child,
          );
        }));

    return true;
  }
}
