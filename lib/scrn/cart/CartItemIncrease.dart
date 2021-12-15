import 'package:flutter/material.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/model/CartItem.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/states/CartState.dart';
import 'package:provider/provider.dart';

class CartItemIncrease extends StatefulWidget {
  int position;
  //void Function() function;
  //CartItem cartItem;

  CartItemIncrease(this.position /* this.cartItem*/);

  @override
  CartItemIncreaseState createState() => CartItemIncreaseState();

  void action(AppState appState) {
    appState.increase(position);
  }

  String symbol() {
    return "+";
  }
}

class CartItemIncreaseState extends State<CartItemIncrease> {
  //void Function() increaseFunction;

  /*late CartItem cartItem;

  void initState() {
    super.initState();
    cartItem = widget.cartItem;
  }*/

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      return InkWell(
        onTap: () {
          setState(() {
            widget.action(appState);
          });
        },
        child: Container(
          height: 30.0,
          width: 28.0,
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(color: Colors.black12.withOpacity(0.1)))),
          child: Center(child: Text(widget.symbol())),
        ),
      );
    });
  }
}
