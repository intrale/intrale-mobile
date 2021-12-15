import 'package:flutter/material.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/scrn/cart/CarItemCountBar.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/states/CartState.dart';
import 'package:provider/provider.dart';

const TextStyle ITEM_DESCRIPTION_TEXT_STYLE = TextStyle(
  color: Colors.black54,
  fontWeight: FontWeight.w500,
  fontSize: 12.0,
);

const TextStyle ITEM_NAME_TEXT_STYLE = TextStyle(
  fontWeight: FontWeight.w700,
  fontFamily: "Sans",
  color: Colors.black87,
);

class CartItemCard extends StatefulWidget {
  int position;

  CartItemCard(this.position);

  @override
  CartItemCardState createState() => CartItemCardState();
}

class CartItemCardState extends State<CartItemCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 10.0, right: 5.0),
          child: Column(
            /// Text Information Item
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                '${appState.item(widget.position).name}',
                style: ITEM_NAME_TEXT_STYLE,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                '${appState.item(widget.position).description}',
                style: ITEM_DESCRIPTION_TEXT_STYLE,
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text('${appState.item(widget.position).price.unitPrice}'),
              CartItemCountBar(widget.position),
            ],
          ),
        ),
      );
    });
  }
}
