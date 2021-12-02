import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/model/CartItem.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartState extends ChangeNotifier {
  Cart cart;

  CartState(this.cart);

  CartState.fromPreferences(this.cart) {
    String? cartString;
    Cart cart;
    Map<String, dynamic> jsonMap;
    debugPrint("Cart constructor");
    SharedPreferences.getInstance().then((preferences) => {
          debugPrint("Cart retorno de preferencias"),
          cartString = preferences.getString("cart"),
          if (cartString != null)
            {
              debugPrint("CartString:" + cartString!),
              jsonMap = jsonDecode(cartString!),
              cart = Cart.fromJson(jsonMap),
              this.cart.items = cart.items
            }
          else
            {
              debugPrint("CartString es nulo"),
            }
        });
  }

  List<CartItem> get() => cart.items;

  CartItem item(int index) => cart.items[index];

  int length() => cart.items.length;

  int count() {
    int count = 0;
    cart.items.forEach((element) {
      count += element.count;
    });
    return count;
  }

  void add(CartItem cartItem) {
    debugPrint("Agregando cartItem");
    cart.items.add(cartItem);
    debugPrint("notificando cartItem");
    _notify();
  }

  void remove(int index) {
    cart.items.remove(index);
    _notify();
  }

  void _notify() {
    debugPrint("Norificando cart");
    String cartString;
    Cart cartToSerialize;
    SharedPreferences.getInstance().then((preferences) => {
          debugPrint("Norificando cart retorno de preferencias"),
          cartToSerialize = Cart(),
          cartToSerialize.items = cart.items,
          cartString = jsonEncode(cartToSerialize),
          debugPrint("Norificando cartString:" + cartString),
          preferences.setString("cart", cartString)
        });
    notifyListeners();
  }
}
