//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intrale/comp/images/ScaledImage.dart';
import 'package:intrale/comp/texts/MarginText.dart';
import 'package:intrale/model/Product.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/styles/DecorationStyles.dart';
import 'package:intrale/styles/PaddingStyles.dart';
import 'package:intrale/styles/TextStyles.dart';
import 'package:provider/provider.dart';

class ItemGrid extends StatelessWidget {
  //GridItem gridItem;
  Product gridItem;
  ItemGrid(this.gridItem);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Consumer<AppState>(builder: (context, appState, child) {
      return InkWell(
        onTap: () {
          debugPrint("OnTap ItemGrid");
          appState.setProduct(gridItem);
          appState.forwardToDetailProductScreen();
        },
        child: Container(
          decoration: DecorationStyles.ITEM_GRID,
          child: Wrap(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  /// Set Animation image to detailProduk layout
                  Hero(
                    tag: "hero-grid-${gridItem.id}",
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) {
                                return new Material(
                                  color: Colors.black54,
                                  child: Container(
                                    padding: EdgeInsets.all(30.0),
                                    child: InkWell(
                                      child: Hero(
                                          tag: "hero-grid-${gridItem.id}",
                                          child: 
                                            ScaledImage(
                                              path:"/dev/files/get/INTRALE/products/${gridItem.id}/main.jpg",
                                              height: mediaQueryData.size.height,
                                              width: mediaQueryData.size.width,
                                              )
                                          ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                              transitionDuration: Duration(milliseconds: 500)));
                        },
                        child: ScaledImage(
                          path: '/dev/files/get/INTRALE/products/${gridItem.id}/main.jpg',
                          height: mediaQueryData.size.height / 5,
                          width: 200.0,
                        ),
                      ),
                    ),
                  ),
                  PaddingStyles.EDGE_INSETS_ALL_5,
                  MarginText(
                    text: gridItem.name,
                    style: TextStyles.DASHBOARD_GRID_TITLE,
                    left: 15.0,
                    right: 15.0,
                    ),

                  PaddingStyles.EDGE_INSETS_ALL_1,

                  MarginText(
                      text: gridItem.price.currencyAcronym + gridItem.price.unitPrice.toString(), 
                      style: TextStyles.DASHBOARD_GRID_PRICE,
                      left: 15.0,
                      right: 15.0,),

                  PaddingStyles.EDGE_INSETS_ALL_30,

                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
