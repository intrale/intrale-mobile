import 'package:flutter/material.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/model/Product.dart';
import 'package:intrale/scrn/home/DetailProductAddItemButton.dart';
import 'package:intrale/scrn/home/DetailProductAppBar.dart';
import 'package:intrale/scrn/home/DetailProductCardData.dart';
import 'package:intrale/scrn/home/DetailProductCardDescription.dart';
import 'package:intrale/scrn/home/DetailProductImageSlider.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/states/CartState.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatefulWidget {
  //Product gridItem;

  DetailProduct(
      /*this.gridItem*/); /* {
    debugPrint("Constructor DetailProduct");
  }*/

  @override
  DetailProductState createState() => DetailProductState(/*gridItem*/);
}

/// Detail Product for Recomended Grid in home screen
class DetailProductState extends State<DetailProduct> {
  /// Declaration List item HomeGridItemRe....dart Class
  /*final Product gridItem;*/
  DetailProductState(
      /*this.gridItem*/); /* {
    debugPrint("Constructor DetailProductState");
  }*/

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return /*ChangeNotifierProvider(
        create: (context) => CartState(Cart()),
        child:*/
        Consumer<AppState>(builder: (context, appState, child) {
      return Scaffold(
        key: _key,
        appBar: DetailProductAppBar(),
        body: Column(
          children: <Widget>[
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// Header image slider
                    DetailProductImageSlider(appState.product),

                    /// Background white title,price and ratting
                    DetailProductCardData(appState.product),

                    /// Background white for description
                    DetailProductCardDescription(appState.product),
                  ],
                ),
              ),
            ),
            DetailProductAddItemButton(appState.product, _key)
          ],
        ),
      );
    }) /*)*/;
  }
}
