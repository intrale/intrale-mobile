import 'package:flutter/material.dart';
import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/ItlCustom.dart';
import 'package:intrale/comp/ItlText.dart';
import 'package:intrale/const/TextStyleConst.dart';
import 'package:intrale/scrn/Dashboard.dart';
import 'package:intrale/scrn/LoginOrSignup/Login.dart';
import 'package:intrale/util/services/Request.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/users/validateToken/ValidateTokenService.dart';
import 'package:intrale/util/tools.dart';
import 'package:intrale/util/users.dart';
import 'package:intrale/scrn/LoginOrSignup/ChoseLoginOrSignup.dart';
import 'package:intrale/scrn/OnBoarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String ACCESS_TOKEN = 'accessToken';
const String ID_TOKEN = 'idToken';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

/// Component UI
class SplashScreenState extends IntraleState<SplashScreen> {

  SplashScreenState() : super();

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();

    ItlCustom.instance.initialize().then((value) => {
          Future.delayed(
              new Duration(milliseconds: 2000),
              () => {
                    usernameExists().then((exist) => {
                          if (exist)
                            {validateToken(context)}
                          else
                            {
                              Future.delayed(new Duration(milliseconds: 2000),
                                  redirectTo(context, onBoarding()))
                            }
                        })
                  })
        });
  }

  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    BoxDecoration manImage = BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/man.png'), fit: BoxFit.cover));

    BoxDecoration gradientBlack =  BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color.fromRGBO(0, 0, 0, 0.3),
              Color.fromRGBO(0, 0, 0, 0.4)
            ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter));

    ItlText welcomeTo = ItlText(
                      textKey: "welcomeTo", style: SPLASH_SCREEN_WELCOME_TO);

    Hero hero = Hero(
                      tag: "Intrale",
                      child: ItlText(
                          textKey: "businessName",
                          style: SPLASH_SCREEN_BUSINESS_NAME));


    return Container(
      /// Set Background image in splash screen layout (Click to open code)
      decoration: manImage,
      child: Container(
        /// Set gradient black in image splash screen (Click to open code)
        decoration: gradientBlack,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                  ),

                  /// Text header "Welcome To" (Click to open code)
                  welcomeTo,

                  /// Animation text Treva Shop to choose Login with Hero Animation (Click to open code)
                  hero
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateToken(BuildContext context) {
    Future<SharedPreferences> sharedPreferences =
        SharedPreferences.getInstance();
    sharedPreferences.then((preferences) => {
          if (preferences.getString(ACCESS_TOKEN) != null)
            {
              // Validar que el token sea valido
              ValidateTokenService()
                  .post(request: Request())
                  .then((response) => tokenOk(response, context))
                  .catchError((error, stackTrace) => forwardToLogin(context))
            }
          else
            {
              Future.delayed(new Duration(milliseconds: 2000),
                  redirectTo(context, ChoseLogin()))
            }
        });
  }

  void tokenOk(Response response, BuildContext context) async {
    if (response.statusCode == 200) {
      redirectTo(context, Dashboard());
    } else {
      forwardToLogin(context);
    }
  }

  void forwardToLogin(BuildContext context) {
    Future<SharedPreferences> sharedPreferences =
        SharedPreferences.getInstance();
    sharedPreferences.then((preference) => removeTokens(preference));
    redirectTo(context, new Login());
  }

  void removeTokens(SharedPreferences sharedPreferences) {
    sharedPreferences.remove(ACCESS_TOKEN);
    sharedPreferences.remove(ID_TOKEN);
  }
}
