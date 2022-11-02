import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/SplashScreenBackgroundImage.dart';
import 'package:intrale/comp/IntraleState.dart';
import 'package:intrale/comp/ItlCustom.dart';
import 'package:intrale/comp/texts/TranslatedText.dart';
import 'package:intrale/styles/DecorationStyles.dart';
import 'package:intrale/styles/PaddingStyles.dart';
import 'package:intrale/styles/TextStyles.dart';
import 'package:intrale/util/IntralePreferences.dart';
import 'package:intrale/util/Wait.dart';
import 'package:intrale/util/services/Request.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/users/validateToken/ValidateTokenService.dart';

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

    ItlCustom.instance.initialize().then((value) => validateToken(context));

  }

  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    
    TranslatedText welcomeTo = TranslatedText(
                      textKey: "welcomeTo", style: TextStyles.WELCOME_PREFIX);

    Hero hero = Hero(
                      tag: "Intrale",
                      child: TranslatedText(
                          textKey: "businessName",
                          style: TextStyles.WELCOME_BUSINESS_NAME));

    return Container(
      /// Set Background image in splash screen layout (Click to open code)
      decoration: SplashScreenBackgroundImage(),
      child: Container(
        /// Set gradient black in image splash screen (Click to open code)
        decoration: DecorationStyles.GRADIENT_BLACK,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PaddingStyles.ONLY_TOP_30,

                  /// Text header "Welcome To" (Click to open code)
                  welcomeTo,

                  /// Animation text Business Name to choose Login with Hero Animation (Click to open code)
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
    IntralePreferences().read().then((value) => {
      if (value.accessToken!=null){
              // Validar que el token sea valido
              ValidateTokenService()
                  .post(request: Request())
                  .then((response) => tokenOk(response, context))
                  .catchError((error, stackTrace) => forwardToLogin(context))
      } else {
        Wait(milliseconds: 4000, onFinishFunction: ()=>context.go('/choseLogin'))
      }
    });

  }

  void tokenOk(Response response, BuildContext context) async {
    if (response.statusCode == 200) {
      context.go('/dashboard');
    } else {
      forwardToLogin(context);
    }
  }

  void forwardToLogin(BuildContext context) {
    IntralePreferences().reset();
    context.go('/login');
  }

}
