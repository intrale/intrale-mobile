import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intrale/scrn/account/Profile.dart';
import 'package:intrale/scrn/cart/CartScreen.dart';
import 'package:intrale/scrn/home/Home.dart';

class ScreenState extends ChangeNotifier {
  int screenIndex = 0;

  Map<int, Widget> screens = {0: Home(), 1: CartScreen(), 2: profil()};

  Widget? getScreen() {
    return screens[screenIndex];
  }

  void setIndex(int index) {
    this.screenIndex = index;
  }
}
