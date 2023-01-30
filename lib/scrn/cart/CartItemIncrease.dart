import 'package:flutter/material.dart';
import 'package:intrale/comp/icons/ProvidedIcon.dart';
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

  Widget button() {
    return ProvidedIcon(
                            icon:Icons.add_circle
                          );
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
        child: 
            widget.button()

      );
    });
  }
}
