import 'package:flutter/material.dart';
import 'package:intrale/states/AppState.dart';
import 'package:provider/provider.dart';

class CartItemIncrease extends StatefulWidget {
  int position;

  CartItemIncrease(this.position);

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
