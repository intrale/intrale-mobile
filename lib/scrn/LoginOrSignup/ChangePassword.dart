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

import 'package:intrale/util/services/signin/SigninRequest.dart';
import 'package:intrale/util/services/signin/SigninResponse.dart';
import 'package:intrale/util/services/signin/SigninService.dart';

import '../BottomNavigationBar.dart';

class ChangePassword extends StatefulWidget {
  String email;

  ChangePassword({this.email}) {}

  @override
  ChangePasswordState createState() => ChangePasswordState(email: email);
}

/// Component Widget this layout UI
class ChangePasswordState extends State<ChangePassword>
    with TickerProviderStateMixin
    implements SubmitEvent {
  String email;

  ChangePasswordState({this.email}) {}

  SigninService signinService = new SigninService();

// Fields declarations
  IntraleTextField name = IntraleTextField(
    icon: Icons.vpn_key,
    password: false,
    description: 'name',
    inputType: TextInputType.text,
    validator: Required(),
  );

  IntraleTextField familyName = IntraleTextField(
    icon: Icons.vpn_key,
    password: false,
    description: 'familyName',
    inputType: TextInputType.text,
    validator: Required(),
  );

  IntraleTextField actual = IntraleTextField(
    icon: Icons.vpn_key,
    password: true,
    description: 'actual',
    inputType: TextInputType.text,
    validator: Required(),
  );

  IntraleTextField newPassword = IntraleTextField(
    icon: Icons.vpn_key,
    password: true,
    description: 'newPassword',
    inputType: TextInputType.text,
    validator: Required(),
  );

  IntraleTextField repeatPassword = IntraleTextField(
    icon: Icons.vpn_key,
    password: true,
    description: 'repeatPassword',
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

                    Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                    this.actual,

                    /// TextFromField Password
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                    this.newPassword,

                    /// TextFromField Password
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                    this.repeatPassword,

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
    SigninResponse signinResponse = await signinService.post(SigninRequest(
        name: this.name.value,
        familyName: this.familyName.value,
        username: this.email,
        email: this.email,
        password: this.actual.value,
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
