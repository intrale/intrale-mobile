import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intrale/IntraleRouter.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/util/IntralePreferences.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

/// Run first apps open
void main() { 
  runApp(IntraleApp());
  configLoading();
}

/// Set orienttation
class IntraleApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    //Initialize Firebase
    Firebase.initializeApp(
      options: DefaultFirebaseOptions .currentPlatform)
    .then(
      (value) => {
        print('Finaliza Firebase.initializeApp'),
        FirebaseMessaging.instance.getToken().then((value) => {
          print('fcmToken:' + value.toString()),
          IntralePreferences().writeFCMToken(value.toString())
        })
      }
    );

    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));

    return getApp();

  }
}


Widget getApp(){

  print('MaterialApp getApp()');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AppState()),
        Provider(create: (context)=>IntraleRouter())
      ],
      child: Builder(builder: (context){
        final router = Provider.of<IntraleRouter>(context, listen: false).router;
        return MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          localizationsDelegates: [FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
                basePath: 'assets/flutter_i18n',
                fallbackFile: 'es',
                useCountryCode: false),
            missingTranslationHandler: (key, locale) {
              print("--- Missing Key: $key, languageCode: ${locale?.languageCode}");
            },
          ),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          title: 'GoRouter Example',
          builder: EasyLoading.init(),
        );
      }),
    
    );

}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Color(0xFF121940)
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Color(0xFF6E48AA)
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
    //..customAnimation = CustomAnimation();
}