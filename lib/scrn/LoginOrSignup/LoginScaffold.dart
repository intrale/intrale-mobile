import 'package:flutter/material.dart';

import 'package:intrale/scrn/LoginOrSignup/LoginBoxDecoration.dart';
import 'package:intrale/scrn/LoginOrSignup/LoginImageBoxDecoration.dart';

class LoginScaffold extends Scaffold {
  var children;

  LoginScaffold({this.children})
      : assert(children != null),
        super(
            backgroundColor: Colors.white,
            body: Container(

                /// Set Background image in layout (Click to open code)
                decoration: LoginImageBoxDecoration(),
                child: Container(

                    /// Set gradient color in image (Click to open code)
                    decoration: LoginBoxDecoration(),

                    /// Set component layout
                    child: ListView(children: children)))) {}
}
