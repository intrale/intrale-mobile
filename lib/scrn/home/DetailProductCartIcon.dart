import 'package:flutter/material.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/scrn/cart/CartScreen.dart';
import 'package:intrale/states/CartState.dart';
import 'package:intrale/util/tools.dart';
import 'package:provider/provider.dart';

class DetailProductCartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(builder: (context, cart, child) {
      return InkWell(
        onTap: () {
          redirectTo(context, CartScreen());
        },
        child: Stack(
          alignment: AlignmentDirectional(-1.0, -0.8),
          children: <Widget>[
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black26,
                )),
            CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.red,
              child: Text(
                cart.count().toString(),
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              ),
            ),
          ],
        ),
      );
    });
  }
}
