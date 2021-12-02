import 'package:intrale/model/Cart.dart';
import 'package:intrale/scrn/cart/CartItemIncrease.dart';
import 'package:intrale/states/CartState.dart';

class CartItemDecrease extends CartItemIncrease {
  CartItemDecrease(position) : super(position);

  @override
  void action(CartState cart) {
    cart.item(position).increase();
  }

  @override
  String symbol() {
    return "-";
  }
}
