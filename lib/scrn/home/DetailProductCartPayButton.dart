import 'package:flutter/material.dart';
import 'package:intrale/states/AppState.dart';
import 'package:provider/provider.dart';

const TextStyle CART_PAY_TEXT_STYLE =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w700);

class DetailProductCartPayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      return InkWell(
        onTap: () {
          appState.forwardToCartScreen();
          //context.go('/delivery');
        },
        child: Container(
          height: 45.0,
          width: 200.0,
          decoration: BoxDecoration(
            color: Colors.indigoAccent,
          ),
          child: Center(
            child: Text(
              'cartPay',
              style: CART_PAY_TEXT_STYLE,
            ),
          ),
        ),
      );
  });
}}
