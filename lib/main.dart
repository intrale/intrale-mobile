import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intrale/splashScreen.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// Run first apps open
void main() { 
  runApp(MaterialApp(home: IntraleApp()));
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
        /*var fcmToken = FirebaseMessaging.instance.getToken(),*/
        FirebaseMessaging.instance.getToken().then((value) => print('fcmToken:' + value.toString()))
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

    /* return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => print('Finaliza Firebase.initializeApp')),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return getApp();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return getApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return getApp();
      },
    );*/
  }


  }


MaterialApp getApp(){

  print('Obteniendo fcmToken');

    return MaterialApp(localizationsDelegates: [
      FlutterI18nDelegate(
        translationLoader: FileTranslationLoader(
            basePath: 'assets/flutter_i18n',
            fallbackFile: 'es',
            useCountryCode: false),
        missingTranslationHandler: (key, locale) {
          print("--- Missing Key: $key, languageCode: ${locale?.languageCode}");
        },
      ),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ], supportedLocales: [
      Locale('en', ''), // English, no country code
      Locale('es', ''), // Spanish, no country code
    ], home: SplashScreen());
}