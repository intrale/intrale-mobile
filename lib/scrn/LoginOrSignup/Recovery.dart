import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intrale/comp/styles/SansWhiteW6S13Style.dart';
import 'package:intrale/comp/styles/SansWhiteW9S20LS6Style.dart';

import 'package:intrale/comp/Language_Library/lib/easy_localization_delegate.dart';

import 'package:intrale/comp/IntraleForm.dart';
import 'package:intrale/comp/IntraleTextField.dart';
import 'package:intrale/comp/SubmitEvent.dart';
import 'package:intrale/scrn/LoginOrSignup/Confirm.dart';

import 'package:intrale/scrn/LoginOrSignup/LoginChoreographer.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginScaffold.dart';

import 'package:intrale/scrn/LoginOrSignup/Login.dart';
import 'package:intrale/util/services/Error.dart';
import 'package:intrale/util/services/recovery/RecoveryResponse.dart';
import 'package:intrale/util/services/recovery/RecoveryService.dart';
import 'package:intrale/util/services/signup/SignupRequest.dart';
import 'package:intrale/util/validation/FormatValidation.dart';

import 'package:intrale/util/validation/MultipleValidations.dart';
import 'package:intrale/util/validation/Required.dart';

import 'Signup.dart';

class Recovery extends StatefulWidget {
  @override
  _recoveryScreenState createState() => _recoveryScreenState();
}

/// Component Widget this layout UI
class _recoveryScreenState extends State<Recovery>
    with TickerProviderStateMixin
    implements SubmitEvent {
  RecoveryService recoveryService = new RecoveryService();

// Fields declarations
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

                    /// TextFromField Email
                    Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                    this.email,

                    new LoginChoreographer(
                        form: form,
                        vsync: this,
                        description: 'recovery.button'),

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
                          AppLocalizations.of(context).tr('haveUser'),
                          style: SansWhiteW6S13Style(),
                        )),
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
    RecoveryResponse recoveryResponse =
        await recoveryService.post(SignupRequest(email: this.email.value));

    if (recoveryResponse.statusCode != 200) {
      Error error = recoveryResponse.errors.first;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Ocurrio un error:" + error.code),
                content: Text(error.description));
          });
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => new Confirm()));
    }
    return true;
  }
}
