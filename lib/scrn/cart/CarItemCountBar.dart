import 'package:flutter/material.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/model/CartItem.dart';
import 'package:intrale/scrn/cart/CartItemDecrease.dart';
import 'package:intrale/scrn/cart/CartItemIncrease.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/states/CartState.dart';
import 'package:provider/provider.dart';

class CartItemCountBar extends StatefulWidget {
  int position;

  //CartItem cartItem;

  /*void Function() increaseFunction;
  void Function() decreaseFunction;
  String Function() countFunction;*/

  CartItemCountBar(
      this.position /*
      this.increaseFunction, this.decreaseFunction, this.countFunction*/
      );

  @override
  CartItemCountBarState createState() => CartItemCountBarState(
      /*increaseFunction, decreaseFunction, countFunction*/);
}

class CartItemCountBarState extends State<CartItemCountBar> {
  /*void Function() increaseFunction;
  void Function() decreaseFunction;
  String Function() countFunction;*/

  /*late CartItem cartItem;

  void initState() {
    super.initState();
    cartItem = widget.cartItem;
  }*/

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      return Padding(
        padding: const EdgeInsets.only(top: 18.0, left: 0.0),
        child: Container(
          width: 112.0,
          decoration: BoxDecoration(
              color: Colors.white70,
              border: Border.all(color: Colors.black12.withOpacity(0.1))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CartItemDecrease(widget.position),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(appState.item(widget.position).count.toString()),
              ),
              CartItemIncrease(widget.position),
            ],
          ),
        ),
      );
    });
  }
}
