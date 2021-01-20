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

import 'package:intrale/scrn/LoginOrSignup/Login.dart';
import 'package:intrale/util/services/Error.dart';
import 'package:intrale/util/services/signup/SignupRequest.dart';
import 'package:intrale/util/services/signup/SignupResponse.dart';
import 'package:intrale/util/services/signup/SignupService.dart';
import 'package:intrale/util/validation/FormatValidation.dart';
import 'package:intrale/util/validation/MinLength.dart';

import 'package:intrale/util/validation/MultipleValidations.dart';
import 'package:intrale/util/validation/Required.dart';

import 'package:intrale/scrn/BottomNavigationBar.dart';

class Signup extends StatefulWidget {
  @override
  _signupScreenState createState() => _signupScreenState();
}

/// Component Widget this layout UI
class _signupScreenState extends State<Signup>
    with TickerProviderStateMixin
    implements SubmitEvent {
  SignupService signupService = new SignupService();

// Fields declarations
  IntraleTextField name = IntraleTextField(
      icon: Icons.person,
      password: false,
      description: 'signup.name',
      inputType: TextInputType.name,
      validator:
          MultipleValidations(validations: [Required(), MinLength(length: 3)]));

  IntraleTextField familyName = IntraleTextField(
      icon: Icons.person,
      password: false,
      description: 'signup.familyName',
      inputType: TextInputType.name,
      validator: Required());

  IntraleTextField email = IntraleTextField(
      icon: Icons.email,
      password: false,
      description: 'signup.email',
      inputType: TextInputType.emailAddress,
      validator: MultipleValidations(validations: [
        Required(),
        FormatValidation(
            regexp: FormatValidation.EMAIL_PATTERN,
            message: 'Debe tener formato de email.')
      ]));

  IntraleTextField password = IntraleTextField(
    icon: Icons.vpn_key,
    password: true,
    description: 'signup.password',
    inputType: TextInputType.text,
    validator: MultipleValidations(validations: [
      Required(),
      FormatValidation(
          regexp: FormatValidation.PASSWORD_PATTERN,
          message: 'Debe tener formato de contraseña.')
    ]),
  );

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.width;
    mediaQueryData.size.height;

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

                    Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                    this.name,

                    Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                    this.familyName,

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
                                      new Login()));
                        },
                        child: Text(
                          AppLocalizations.of(context).tr('notHaveLogin'),
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
          new LoginChoreographer(
              form: form, vsync: this, description: 'signUp'),
        ],
      ),
    ]);
    return form;
  }

  @override
  Future<bool> onSubmit() async {
    SignupResponse signupResponse = await signupService.post(SignupRequest(
        name: this.name.value,
        familyName: this.familyName.value,
        username: this.email.value,
        email: this.email.value,
        password: this.password.value));

    if (signupResponse.statusCode != 200) {
      Error error = signupResponse.errors.first;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Ocurrio un error:" + error.code),
                content: Text(error.description));
          });
    } else {
      debugPrint('Userstatus: ' + signupResponse.userStatus);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => new bottomNavigationBar()));
    }
    return true;
  }
}
