import 'package:go_router/go_router.dart';
import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/ItlText.dart';
import 'package:intrale/const/TextStyleConst.dart';
import 'package:intrale/scrn/LoginOrSignup/ChoseLoginOrSignupCarousel.dart';
import 'package:intrale/comp/buttons/TransparentButton.dart';
import 'package:flutter/material.dart';
import 'package:intrale/styles/IntraleStyles.dart';

class ChoseLogin extends StatefulWidget {
  @override
  ChoseLoginState createState() => ChoseLoginState();
}

/// Component Widget this layout UI
class ChoseLoginState extends IntraleState<ChoseLogin> {

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ChoseLoginOrSignupCarousel(),
          Container(
            decoration: BoxDecoration(),
            child: Container(
              decoration: Styles.DECORATION_STYLES.GRADIENT_BLACK,
              child: ListView(
                padding: EdgeInsets.all(0.0),
                children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: <Widget>[
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          Container(
                            alignment: AlignmentDirectional.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                mediaQueryTopPadding(50),
                                header,
                                Styles.PADDING_STYLES.ONLY_TOP_250,
                                ItlText(textKey: "choseLogin_hint", 
                                  textDirection: TextDirection.ltr,
                                  style: CHOSE_LOGIN_OR_SIGNUP_SCREEN_HINT,
                                ),
                                Styles.PADDING_STYLES.ONLY_TOP_250
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              TransparentButton(
                                  descriptionKey: "choseLogin_login",
                                  onTap: ()=>context.go('/login')),
                              topPadding(1.0),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    /// To set white line (Click to open code)
                                    Styles.CONTAINER_STYLES.WHITE_LINE,
                                    Padding(
                                      padding: Styles.EDGE_INSETS_GEOMETRY_STYLES.BOTH_SIDES_10,
                                    ),

                                    /// To set white line (Click to open code)
                                    Styles.CONTAINER_STYLES.WHITE_LINE
                                  ],
                                ),
                              ),
                              topPadding(70.0),
                            ],
                          ),

                          /// To create animation if user tap == animation play (Click to open code)
                          TransparentButton(
                              descriptionKey: "choseLogin_signup",
                              onTap: () => context.go('/signup'))
                        ],
                      ),



                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
