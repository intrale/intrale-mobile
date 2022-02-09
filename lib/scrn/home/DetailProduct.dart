import 'package:flutter/material.dart';
import 'package:intrale/scrn/home/DetailProductAddItemButton.dart';
import 'package:intrale/scrn/home/DetailProductAppBar.dart';
import 'package:intrale/scrn/home/DetailProductCardData.dart';
import 'package:intrale/scrn/home/DetailProductCardDescription.dart';
import 'package:intrale/scrn/home/DetailProductImageSlider.dart';
import 'package:intrale/states/AppState.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatefulWidget {
  DetailProduct();

  @override
  DetailProductState createState() => DetailProductState();
}

/// Detail Product for Recomended Grid in home screen
class DetailProductState extends State<DetailProduct> {
  /// Declaration List item HomeGridItemRe....dart Class
  DetailProductState();

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
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
    });
  }
}
