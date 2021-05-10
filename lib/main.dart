import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intrale/util/DeepLinkBloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intrale/scrn/LoginOrSignup/ChoseLoginOrSignup.dart';
import 'package:intrale/scrn/OnBoarding.dart';

import 'comp/Language_Library/lib/easy_localization_delegate.dart';
import 'comp/Language_Library/lib/easy_localization_provider.dart';

/// Run first apps open
void main() => runApp(EasyLocalization(child: myApp()));

/// Set orienttation
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = DeepLinkBloc();
    var data = EasyLocalizationProvider.of(context).data;

    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));

    return EasyLocalizationProvider(
      data: data,
      child: new MaterialApp(
        title: "Intrale",
        theme: ThemeData(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            primaryColorLight: Colors.white,
            primaryColorBrightness: Brightness.light,
            primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Provider<DeepLinkBloc>(
                create: (context) => _bloc,
                dispose: (context, bloc) => bloc.dispose(),
                child: SplashScreen())

            /*body: SplashScreen()*/),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          EasylocaLizationDelegate(
            locale: data.locale,
            path: 'assets/language',
          )
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('zh', 'HK'),
          Locale('ar', 'DZ'),
          Locale('hi', 'IN'),
          Locale('id', 'ID')
        ],
        locale: data.savedLocale,
      ),
    );
  }
}

/// Component UI
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {
  /// Check user
  bool _checkUser = true;

  SharedPreferences prefs;

  Future<Null> _function() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    this.setState(() {
      if (prefs.getString("username") != null) {
        print('false');
        _checkUser = false;
      } else {
        print('true');
        _checkUser = true;
      }
    });
  }

  @override

  /// Setting duration in splash screen
  startTime() async {
    return new Timer(Duration(milliseconds: 4500), NavigatorPage);
  }

  /// To navigate layout change
  void NavigatorPage() {
    if (_checkUser) {
      /// if userhas never been login
      Navigator.of(context).pushReplacement(
          PageRouteBuilder(pageBuilder: (_, __, ___) => onBoarding()));
    } else {
      /// if userhas ever been login
      Navigator.of(context).pushReplacement(
          PageRouteBuilder(pageBuilder: (_, __, ___) => ChoseLogin()));
    }
  }

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    startTime();
    _function();
  }

  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    DeepLinkBloc _bloc = Provider.of<DeepLinkBloc>(context);
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          /// Set Background image in splash screen layout (Click to open code)
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/man.png'), fit: BoxFit.cover)),
          child: Container(
            /// Set gradient black in image splash screen (Click to open code)
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color.fromRGBO(0, 0, 0, 0.3),
                  Color.fromRGBO(0, 0, 0, 0.4)
                ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter)),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30.0),
                      ),

                      /// Text header "Welcome To" (Click to open code)
                      Text(
                        AppLocalizations.of(context).tr('welcomeTo'),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                          fontFamily: "Sans",
                          fontSize: 19.0,
                        ),
                      ),

                      /// Animation text Treva Shop to choose Login with Hero Animation (Click to open code)
                      Hero(
                        tag: "Intrale",
                        child: Text(
                          AppLocalizations.of(context).tr('title'),
                          style: TextStyle(
                            fontFamily: 'Sans',
                            fontWeight: FontWeight.w900,
                            fontSize: 35.0,
                            letterSpacing: 0.4,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
