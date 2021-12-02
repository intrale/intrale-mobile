import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/scrn/LoginOrSignup/Login.dart';
import 'package:intrale/scrn/account/Profile.dart';
import 'package:intrale/scrn/cart/CartScreen.dart';
import 'package:intrale/scrn/home/Home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TextStyle ITEM_TEXT_STYLE =
    TextStyle(fontFamily: "Berlin", letterSpacing: 0.5);

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  Map<int, Widget> screens = {0: Home(), 1: CartScreen(), 2: profil()};
  int currentIndex = 0;

  void removeTokens(SharedPreferences sharedPreferences) {
    sharedPreferences.remove('accessToken');
    sharedPreferences.remove('idToken');
    //Borra el carrito de compras cuando sale, ver a futuro si esto es necesario
    //por el momento se coloca debido a las contanstantes actualizaciones
    // del json que se almacena en cart, para que no resulte en incompatibilidades
    sharedPreferences.remove('cart');
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

  Widget? getScreen() {
    debugPrint("getScreen");
    if (currentIndex < 3) {
      return screens[currentIndex];
    }
    forwardToLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: getScreen(),
            bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                    canvasColor: Colors.white,
                    textTheme: Theme.of(context).textTheme.copyWith(
                        caption: TextStyle(
                            color: Colors.black26.withOpacity(0.15)))),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: currentIndex,
                  fixedColor: Color(0xFF6991C7),
                  onTap: (value) {
                    debugPrint(
                        'ItlNavigationBarrState onTap:' + value.toString());

                    setState(() {
                      debugPrint('ItlNavigationBarrState setState:' +
                          value.toString());
                      currentIndex = value;
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          size: 23.0,
                        ),
                        title: Text(
                          FlutterI18n.translate(context, 'home'),
                          style: ITEM_TEXT_STYLE,
                        )),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart),
                        title: Text(
                          FlutterI18n.translate(context, 'cart'),
                          style: ITEM_TEXT_STYLE,
                        )),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person,
                          size: 24.0,
                        ),
                        title: Text(
                          FlutterI18n.translate(context, 'account'),
                          style: ITEM_TEXT_STYLE,
                        )),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.exit_to_app),
                        title: Text(
                          FlutterI18n.translate(context, 'exit'),
                          style: ITEM_TEXT_STYLE,
                        )),
                  ],
                )));
  }
}
