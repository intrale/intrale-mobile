import 'package:flutter/material.dart';
import 'package:intrale/scrn/LoginOrSignup/Login.dart';
import 'package:intrale/scrn/brand/BrandLayout.dart';
import 'package:intrale/scrn/cart/CartLayout.dart';
import 'package:intrale/scrn/home/Home.dart';
import 'package:intrale/scrn/account/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class bottomNavigationBar extends StatefulWidget {
  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    debugPrint('callPage:' + current.toString());
    switch (current) {
      case 0:
        {
          debugPrint('Invocando a Menu desde bottomNavigationBar');
          return new Menu();
        }
      //case 1:
      //return new brand();
      case 1:
        return new cart();
      case 2:
        return new profil();
      case 3:
        forwardToLogin();
        break;
      default:
        return Menu();
    }
  }

  void removeTokens(SharedPreferences sharedPreferences) {
    sharedPreferences.remove('accessToken');
    sharedPreferences.remove('idToken');
  }

  void forward(SharedPreferences sharedPreferences) {
    removeTokens(sharedPreferences);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => new Login()));
  }

  void forwardToLogin() {
    Future<SharedPreferences> sharedPreferences =
        SharedPreferences.getInstance();
    sharedPreferences.then((preference) => forward(preference));
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(currentIndex),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(color: Colors.black26.withOpacity(0.15)))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            fixedColor: Color(0xFF6991C7),
            onTap: (value) {
              debugPrint('BottomNavigationBar onTap:' + value.toString());
              currentIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 23.0,
                  ),
                  title: Text(
                    'home',
                    style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                  )),
              /*BottomNavigationBarItem(
                    icon: Icon(Icons.shop),
                    title: Text(
                      AppLocalizations.of(context).tr('brand'),
                      style:
                          TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                    )), */
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text(
                    'cart',
                    style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                  title: Text(
                    'account',
                    style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.exit_to_app),
                  title: Text(
                    'exit',
                    style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
                  )),
            ],
          )),
    );
  }
}
