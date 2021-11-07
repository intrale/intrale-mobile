import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/const/TextStyleConst.dart';
import 'package:intrale/scrn/Dashboard.dart';
import 'package:intrale/scrn/LoginOrSignup/Login.dart';
import 'package:intrale/scrn/LoginOrSignup/RedirectButton.dart';
import 'package:intrale/scrn/LoginOrSignup/Signup.dart';
import 'package:intrale/util/tools.dart';
import 'package:flutter/material.dart';
import 'package:intrale/comp/carousel_pro/carousel_pro.dart';

//TODO: Falta completar refactor
class ChoseLogin extends StatefulWidget {
  @override
  ChoseLoginState createState() => ChoseLoginState();
}

/// Component Widget this layout UI
class ChoseLoginState extends IntraleState<ChoseLogin> {
  /*String login;
  String signup;

  Text hintChoseLogin;
  Text orSkip;
  Text title;

  Container carousel;
  BoxDecoration gradientBlack;
  Container whiteLine;

  @override
  void buttonsInitializations() {}

  @override
  void fieldsInitializations() {}

  @override
  void imagesInitializations() {}

  @override
  void othersInitializations() {
    carousel = Container(
      color: Colors.white,
      child: new Carousel(
        boxFit: BoxFit.cover,
        autoplay: true,
        animationDuration: Duration(milliseconds: 300),
        dotSize: 0.0,
        dotSpacing: 16.0,
        dotBgColor: Colors.transparent,
        showIndicator: false,
        overlayShadow: false,
        images: [
          AssetImage('assets/img/girl.png'),
          AssetImage("assets/img/SliderLogin2.png"),
          AssetImage('assets/img/SliderLogin3.png'),
          AssetImage("assets/img/SliderLogin4.png"),
        ],
      ),
    );

    gradientBlack = BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromRGBO(0, 0, 0, 0.3),
      Color.fromRGBO(0, 0, 0, 0.4)
    ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter));

    whiteLine = Container(
      color: Colors.white,
      height: 0.2,
      width: 80.0,
    );
  }

  @override
  void servicesInitializations() {}

  @override
  void textsInitializations() {
    hintChoseLogin = Text(
      AppLocalizations.of(context).choseLogin_hint,
      textDirection: TextDirection.ltr,
      style: CHOSE_LOGIN_OR_SIGNUP_SCREEN_HINT,
    );

    orSkip = Text(
      AppLocalizations.of(context).choseLogin_orSkip,
      textDirection: TextDirection.ltr,
      style: CHOSE_LOGIN_OR_SIGNUP_SCREEN_OR_SKIP,
    );

    title = Text(
      AppLocalizations.of(context).businessName,
      textDirection: TextDirection.ltr,
      style: CHOSE_LOGIN_OR_SIGNUP_SCREEN_BUSINESS_NAME,
    );

    login = AppLocalizations.of(context).choseLogin_login;
    signup = AppLocalizations.of(context).choseLogin_signup;
  }*/

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    mediaQuery.devicePixelRatio;
    mediaQuery.size.height;
    mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          /// Set background image slider
          Container(
            color: Colors.white,
            child: new Carousel(
              boxFit: BoxFit.cover,
              autoplay: true,
              animationDuration: Duration(milliseconds: 300),
              dotSize: 0.0,
              dotSpacing: 16.0,
              dotBgColor: Colors.transparent,
              showIndicator: false,
              overlayShadow: false,
              images: [
                AssetImage('assets/img/girl.png'),
                AssetImage("assets/img/SliderLogin2.png"),
                AssetImage('assets/img/SliderLogin3.png'),
                AssetImage("assets/img/SliderLogin4.png"),
              ],
            ),
          ),
          Container(
            /// Set Background image in layout (Click to open code)
            decoration: BoxDecoration(
//              image: DecorationImage(
//                  image: AssetImage('assets/img/girl.png'), fit: BoxFit.cover)
                ),
            child: Container(
              /// Set gradient color in image (Click to open code)
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Color.fromRGBO(0, 0, 0, 0.3),
                    Color.fromRGBO(0, 0, 0, 0.4)
                  ],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter)),

              /// Set component layout
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
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: mediaQuery.padding.top + 50.0),
                                ),

                                header,

                                /// Padding Text "Get best product in treva shop" (Click to open code)
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 160.0,
                                        right: 160.0,
                                        top: mediaQuery.padding.top + 190.0,
                                        bottom: 10.0),
                                    child: Container(
                                      color: Colors.white,
                                      height: 0.5,
                                    )),

                                /// to set Text "get best product...." (Click to open code)
                                Text(
                                  AppLocalizations.of(context).choseLogin_hint,
                                  textDirection: TextDirection.ltr,
                                  style: CHOSE_LOGIN_OR_SIGNUP_SCREEN_HINT,
                                ),
                                Padding(padding: EdgeInsets.only(top: 250.0)),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              RedirectButton(
                                  txt: AppLocalizations.of(context)
                                      .choseLogin_login,
                                  redirect: new Login()),
                              Padding(padding: EdgeInsets.only(top: 15.0)),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    /// To set white line (Click to open code)
                                    Container(
                                      color: Colors.white,
                                      height: 0.2,
                                      width: 80.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.0, right: 10.0),

                                      /// navigation to home screen if user click "OR SKIP" (Click to open code)
                                      child: InkWell(
                                        onTap: () {
                                          redirectTo(context, Dashboard());
                                        },
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .choseLogin_orSkip,
                                          textDirection: TextDirection.ltr,
                                          style:
                                              CHOSE_LOGIN_OR_SIGNUP_SCREEN_OR_SKIP,
                                        ),
                                      ),
                                    ),

                                    /// To set white line (Click to open code)
                                    Container(
                                      color: Colors.white,
                                      height: 0.2,
                                      width: 80.0,
                                    )
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 70.0)),
                            ],
                          ),

                          /// To create animation if user tap == animation play (Click to open code)
                          RedirectButton(
                              txt: AppLocalizations.of(context)
                                  .choseLogin_signup,
                              redirect: new Signup())
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
