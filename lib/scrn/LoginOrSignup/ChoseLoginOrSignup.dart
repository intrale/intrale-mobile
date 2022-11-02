import 'package:go_router/go_router.dart';
import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/texts/TranslatedText.dart';
import 'package:intrale/scrn/LoginOrSignup/ChoseLoginOrSignupCarousel.dart';
import 'package:intrale/comp/buttons/TransparentButton.dart';
import 'package:flutter/material.dart';
import 'package:intrale/styles/DecorationStyles.dart';
import 'package:intrale/styles/PaddingStyles.dart';
import 'package:intrale/styles/TextStyles.dart';

class ChoseLogin extends StatefulWidget {
  @override
  ChoseLoginState createState() => ChoseLoginState();
}

/// Component Widget this layout UI
class ChoseLoginState extends IntraleState<ChoseLogin> {

    static final Container WHITE_LINE = Container(
                                      color: Colors.white,
                                      height: 0.2,
                                      width: 80.0,
                                    );

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
              decoration: DecorationStyles.GRADIENT_BLACK,
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
                                PaddingStyles.ONLY_TOP_250,
                                TranslatedText(textKey: "choseLogin_hint", 
                                  textDirection: TextDirection.ltr,
                                  style: TextStyles.HINT,
                                ),
                                PaddingStyles.ONLY_TOP_250
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              TransparentButton(
                                  descriptionKey: "choseLogin_login",
                                  onTap: () => Future(()=>context.go('/login'))),
                              topPadding(1.0),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    /// To set white line (Click to open code)
                                    WHITE_LINE,
                                    PaddingStyles.BOTH_SIDES_10,
                                    
                                    /// To set white line (Click to open code)
                                    WHITE_LINE
                                  ],
                                ),
                              ),
                              topPadding(70.0),
                            ],
                          ),

                          /// To create animation if user tap == animation play (Click to open code)
                          TransparentButton(
                              descriptionKey: "choseLogin_signup",
                              onTap: () => Future(() => context.go('/signup')))
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
