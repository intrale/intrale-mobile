import 'package:intrale/model/Cart.dart';
import 'package:intrale/scrn/cart/CartItemIncrease.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/states/CartState.dart';

class CartItemDecrease extends CartItemIncrease {
  CartItemDecrease(position) : super(position);

  @override
  void action(AppState appState) {
    appState.decrease(position);
  }

  @override
  String symbol() {
    return "-";
  }
}
