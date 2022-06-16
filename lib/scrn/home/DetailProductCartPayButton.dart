import 'package:flutter/material.dart';
import 'package:intrale/scrn/cart/Delivery.dart';
import 'package:intrale/util/tools.dart';

const TextStyle CART_PAY_TEXT_STYLE =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w700);

class DetailProductCartPayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        redirectTo(context, delivery());
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
  }
}