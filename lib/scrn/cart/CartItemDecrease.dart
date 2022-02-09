import 'package:intrale/scrn/cart/CartItemIncrease.dart';
import 'package:intrale/states/AppState.dart';

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
