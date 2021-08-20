import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intrale/comp/styles/SansWhiteW6S13Style.dart';
import 'package:intrale/comp/styles/SansWhiteW9S20LS6Style.dart';

import 'package:intrale/comp/Language_Library/lib/easy_localization_delegate.dart';

import 'package:intrale/comp/IntraleForm.dart';
import 'package:intrale/comp/IntraleTextField.dart';
import 'package:intrale/comp/SubmitEvent.dart';

import 'package:intrale/scrn/LoginOrSignup/LoginChoreographer.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginScaffold.dart';

import 'package:intrale/scrn/LoginOrSignup/Signup.dart';
import 'package:intrale/util/validation/Required.dart';
import 'package:intrale/util/services/Error.dart';

import 'package:intrale/util/services/users/signin/SigninRequest.dart';
import 'package:intrale/util/services/users/signin/SigninResponse.dart';
import 'package:intrale/util/services/users/signin/SigninService.dart';

import '../BottomNavigationBar.dart';

class ChangePassword extends StatefulWidget {
  String email;
  String password;

  ChangePassword({this.email, this.password}) {}

  @override
  ChangePasswordState createState() =>
      ChangePasswordState(email: email, password: password);
}

/// Component Widget this layout UI
class ChangePasswordState extends State<ChangePassword>
    with TickerProviderStateMixin
    implements SubmitEvent {
  String email;
  String password;

  ChangePasswordState({this.email, this.password}) {}

  SigninService signinService = new SigninService();

// Fields declarations
  IntraleTextField name = IntraleTextField(
    icon: Icons.person,
    password: false,
    description: 'changePassword.name',
    inputType: TextInputType.text,
    validator: Required(),
  );

  IntraleTextField familyName = IntraleTextField(
    icon: Icons.vpn_key,
    password: false,
    description: 'changePassword.familyName',
    inputType: TextInputType.text,
    validator: Required(),
  );

  IntraleTextField newPassword = IntraleTextField(
    icon: Icons.vpn_key,
    password: true,
    description: 'changePassword.password',
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

                    /// TextFromField Actual Pass
                    Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                    this.name,

                    Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                    this.familyName,

                    /// TextFromField Password
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                    this.newPassword,

                    new LoginChoreographer(
                        form: form,
                        vsync: this,
                        description: 'changePassword.update'),
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
    debugPrint("INTRALE: onSubmit =>" + this.password);

    SigninResponse signinResponse = await signinService.post(SigninRequest(
        name: this.name.value,
        familyName: this.familyName.value,
        username: this.email,
        email: this.email,
        password: this.password,
        newPassword: this.newPassword.value));

    if (signinResponse.statusCode != 200) {
      Error error = signinResponse.errors.first;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Ocurrio un error:" + error.code),
                content: Text(error.description));
          });
    } else {
      // Ingresa normalmente a la aplicacion
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => new bottomNavigationBar()));
    }
    return true;
  }
}
