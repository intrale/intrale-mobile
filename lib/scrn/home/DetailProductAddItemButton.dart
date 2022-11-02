import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/comp/buttons/SolidButton.dart';
import 'package:intrale/comp/buttons/TransparentButton.dart';
import 'package:intrale/model/CartItem.dart';
import 'package:intrale/model/Price.dart';
import 'package:intrale/model/Product.dart';
import 'package:intrale/scrn/home/DetailProductCartPayButton.dart';
import 'package:intrale/scrn/home/DetailProductChatButton.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/styles/DecorationStyles.dart';
import 'package:provider/provider.dart';

class DetailProductAddItemButton extends StatelessWidget {
  Product? gridItem;
  GlobalKey<ScaffoldState> key;

  DetailProductAddItemButton(this.gridItem, this.key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {

      return  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SolidButton(descriptionKey: 'addToCart', onTap: () {
                      return appState.addCartItem(CartItem(
                        id: gridItem!.id,
                        name: gridItem!.name,
                        description: gridItem!.description,
                        price: Price(
                            currencyAcronym: gridItem!.price.currencyAcronym,
                            unitPrice: gridItem!.price.unitPrice),
                        count: 1));
                    }),
                    SolidButton(
                      descriptionKey: 'checkout', 
                      onTap: () => appState.forwardToCartScreen(),
                      decoration: DecorationStyles.SECUNDARY_SOLID_BUTTON,
                      )
                  ],

                );


      /*
      return InkWell(
        onTap: () {
          var snackbar = SnackBar(
            content: Text(
              FlutterI18n.translate(context, 'itemAdded'),
            ),
          );

          appState.addCartItem(CartItem(
              id: gridItem!.id,
              name: gridItem!.name,
              description: gridItem!.description,
              price: Price(
                  currencyAcronym: gridItem!.price.currencyAcronym,
                  unitPrice: gridItem!.price.unitPrice),
              count: 1));
          key.currentState?.showSnackBar(snackbar);
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      color: Colors.white12.withOpacity(0.1),
                      border: Border.all(color: Colors.black12)),
                  child: Center(
                    child: Image.asset(
                      "assets/icon/shopping-cart.png",
                      height: 23.0,
                    ),
                  ),
                ),

                /// Chat Icon
                //DetailProductChatButton(),

                /// Button Pay
                //DetailProductCartPayButton(),
               
                
              ],
            ),
          ),
        ),
      );*/
    });
  }
}
