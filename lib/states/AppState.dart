import 'package:flutter/material.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/model/CartItem.dart';
import 'package:intrale/model/Product.dart';
import 'package:intrale/scrn/account/Message.dart';
import 'package:intrale/scrn/account/Notification.dart';
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
    //3: exit
    4: DetailProduct(),
    5: chat(),
    6: notification()
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

  forwardToHomeScreen() {
    setScreenIndex(0);
  }

  forwardToCartScreen() {
    setScreenIndex(1);
  }

  forwardToProfileScreen() {
    setScreenIndex(2);
  }

  forwardToDetailProductScreen() {
    setScreenIndex(4);
  }

  forwardToChat() {
    setScreenIndex(5);
  }

  forwardToNotifications() {
    setScreenIndex(6);
  }

  Set<CartItem> items() => cart.items;

  CartItem item(int index) => cart.items.elementAt(index);

  void increase(int index) {
    cart.items.elementAt(index).increase();
    notifyListeners();
  }

  void decrease(int index) {
    cart.items.elementAt(index).decrease();
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

  String getTotalPrice() {
    String currencyAcronym = '';
    double price = 0;
    cart.items.forEach((element) {
      price += element.getItemPrice();
      currencyAcronym = element.price.currencyAcronym;
    });
    return currencyAcronym + (price).toString();

  }

  String? cartCountNotificationText(){
    int count = cartCount();
    if (count>0){
      return count.toString();
    }
    return null;
  }

  addCartItem(CartItem cartItem) {
    debugPrint("Agregando cartItem");
    if (cart.items.contains(cartItem)){
      cart.items.lookup(cartItem)!.increase();
    } else {
      cart.items.add(cartItem);
    }
    debugPrint("notificando cartItem");
    notifyListeners();
  }

  void removeCartItem(int index) {
    debugPrint("remove:" + cart.items.remove(item(index)).toString());
    notifyListeners();
  }
}
