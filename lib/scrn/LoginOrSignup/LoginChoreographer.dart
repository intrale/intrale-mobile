import 'package:flutter/material.dart';
import 'package:intrale/comp/IntraleForm.dart';

import 'package:intrale/scrn/LoginOrSignup/LoginAnimation.dart';
import 'package:intrale/comp/IntraleButton.dart';
import 'package:intrale/comp/SubmitEvent.dart';

class LoginChoreographer extends StatefulWidget {
  IntraleForm form;
  final vsync;
  String description;

  LoginChoreographer({this.form, this.vsync, this.description}) {}

  @override
  State<StatefulWidget> createState() {
    return LoginChoreographerState(form, vsync, description);
  }
}

class LoginChoreographerState extends State<LoginChoreographer> {
  //Animation Declaration
  AnimationController sanimationController;
  var tap = 0;
  IntraleForm form;
  var vsync;
  String description;

  LoginChoreographerState(this.form, this.vsync, this.description) {}

  /// set state animation controller
  void initState() {
    sanimationController =
        AnimationController(vsync: vsync, duration: Duration(milliseconds: 800))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tap = 0;
              });
            }
          });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    sanimationController.dispose();
    super.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> _PlayAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }

  handleSubmit(value) {
    debugPrint('handleSubmit');
    if (value) {
      setState(() {
        tap = 1;
      });
      new LoginAnimation(
        animationController: sanimationController.view,
      );
      _PlayAnimation();
    }
  }

  handleError(Exception exception) {
    debugPrint('handleError');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Usuario o password incorrectos'),
          content: Text(exception.toString()),
          actions: [
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Set Animaion after user click buttonLogin
    if (tap == 0) {
      return InkWell(
        splashColor: Colors.yellow,
        onTap: () {
          if (form.formKey.currentState.validate()) {
            setState(() {
              tap = 1;
            });
            new LoginAnimation(
              animationController: sanimationController.view,
            );
            _PlayAnimation();
            SubmitEvent event = form;
            Future<bool> future = event.onSubmit();
            future.then((value) => handleSubmit(value));
            future.catchError((error) => handleError(error));
          }
        },
        child: IntraleButton(
          description: description,
        ),
      );
    } else {
      return new LoginAnimation(
        animationController: sanimationController.view,
      );
    }
  }
}
