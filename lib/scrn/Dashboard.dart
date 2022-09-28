import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/states/AppState.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  void removeTokens(SharedPreferences sharedPreferences) {
    sharedPreferences.remove('accessToken');
    sharedPreferences.remove('idToken');
    //Borra el carrito de compras cuando sale, ver a futuro si esto es necesario
    //por el momento se coloca debido a las contanstantes actualizaciones
    // del json que se almacena en cart, para que no resulte en incompatibilidades
    sharedPreferences.remove('cart');
  }

  void forwardToLogin() {
    Future<SharedPreferences> sharedPreferences =
        SharedPreferences.getInstance();
    sharedPreferences.then((preference) => {
      removeTokens(preference),
      context.go('/login')
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AppState(),
        child: Consumer<AppState>(builder: (context, appState, child) {
          return Scaffold(
              body: appState.getScreen(),
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
                      if (value!=3){
                        setState(() {
                          appState.setScreenIndex(value);
                        });
                      } else {
                        forwardToLogin();
                      }
                    },
                    items: [
                      BottomNavigationBarItem( 
                          icon: Icon(Icons.home),
                          label: FlutterI18n.translate(context, 'home')
                          ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.shopping_cart),
                          label: FlutterI18n.translate(context, 'cart')
                          ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person),
                          label: FlutterI18n.translate(context, 'account')
                          ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.exit_to_app),
                          label: FlutterI18n.translate(context, 'exit')
                          ),
                    ],
                  )));
        }));
  }
}
