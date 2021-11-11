import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intrale/splashScreen.dart';

/// Run first apps open
void main() => runApp(MaterialApp(home: IntraleApp()));

/// Set orienttation
class IntraleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));

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
}
