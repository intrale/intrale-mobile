import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/model/CartItem.dart';
import 'package:intrale/model/Product.dart';
import 'package:intrale/scrn/account/Profile.dart';
import 'package:intrale/scrn/cart/CartScreen.dart';
import 'package:intrale/scrn/home/DetailProduct.dart';
import 'package:intrale/scrn/home/Home.dart';

class AppState extends ChangeNotifier {
  int screenIndex = 0;

  Map<int, Widget> screens = {
    0: Home(),
    1: CartScreen(),
    2: profil(),
    3: DetailProduct()
  };

  Cart cart = Cart();

  Product? product;

  //FIXME: Evaluar si es posible inicializar el carrito dentro del constructor
  AppState(/*this.cart*/);

  void setProduct(Product product) {
    this.product = product;
    notifyListeners();
  }

  Widget? getScreen() {
    return screens[screenIndex];
  }

  void setScreenIndex(int index) {
    this.screenIndex = index;
    notifyListeners();
  }

  void forwardToHomeScreen() {
    setScreenIndex(0);
  }

  void forwardToCartScreen() {
    setScreenIndex(1);
  }

  void forwardToProfileScreen() {
    setScreenIndex(2);
  }

  void forwardToDetailProductScreen() {
    setScreenIndex(3);
  }

  List<CartItem> items() => cart.items;

  CartItem item(int index) => cart.items[index];

  void increase(int index) {
    cart.items[index].increase();
    notifyListeners();
  }

  void decrease(int index) {
    cart.items[index].decrease();
    notifyListeners();
  }

  int cartLength() => cart.items.length;

  int cartCount() {
    int count = 0;
    cart.items.forEach((element) {
      count += element.count;
    });
    return count;
  }

  void addCartItem(CartItem cartItem) {
    debugPrint("Agregando cartItem");
    cart.items.add(cartItem);
    debugPrint("notificando cartItem");
    notifyListeners();
  }

  void removeCartItem(int index) {
    cart.items.remove(index);
    notifyListeners();
  }
}
