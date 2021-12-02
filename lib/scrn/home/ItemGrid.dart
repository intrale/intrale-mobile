import 'package:flutter/material.dart';
import 'package:intrale/model/HomeGridItemRecomended.dart';
import 'package:intrale/model/Product.dart';
import 'package:intrale/scrn/home/DetailProduct.dart';
import 'package:intrale/util/tools.dart';

const TextStyle RATING_ITEM_TEXT_STYLE = TextStyle(
    fontFamily: "Sans",
    color: Colors.black26,
    fontWeight: FontWeight.w500,
    fontSize: 12.0);

const TextStyle TITLE_TEXT_STYLE = TextStyle(
    letterSpacing: 0.5,
    color: Colors.black54,
    fontFamily: "Sans",
    fontWeight: FontWeight.w500,
    fontSize: 13.0);

const TextStyle PRICE_TEXT_STYLE =
    TextStyle(fontFamily: "Sans", fontWeight: FontWeight.w500, fontSize: 14.0);

class ItemGrid extends StatelessWidget {
  //GridItem gridItem;
  Product gridItem;
  ItemGrid(this.gridItem);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        debugPrint("OnTap ItemGrid");
        redirectTo(context, DetailProduct(gridItem));
        /*Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (BuildContext context, __, ___) =>
                new DetailProduct(gridItem),
            transitionDuration: Duration(milliseconds: 900),

            /// Set animation Opacity in route to detailProduk layout
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return Opacity(
                opacity: animation.value,
                child: child,
              );
            }));*/
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF656565).withOpacity(0.15),
                blurRadius: 4.0,
                spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
              )
            ]),
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
                                        child: Image.asset(
                                          "assets/imgItem/fashion1.jpg", //gridItem.img,
                                          width: 300.0,
                                          height: 300.0,
                                          alignment: Alignment.center,
                                          fit: BoxFit.contain,
                                        )),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              );
                            },
                            transitionDuration: Duration(milliseconds: 500)));
                      },
                      child: Container(
                        height: mediaQueryData.size.height / 3.3,
                        width: 200.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7.0),
                                topRight: Radius.circular(7.0)),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/imgItem/fashion1.jpg", /*gridItem.img*/
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 7.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    gridItem.name,
                    overflow: TextOverflow.ellipsis,
                    style: TITLE_TEXT_STYLE,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 1.0)),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    gridItem.price!.unitPrice.toString(),
                    style: PRICE_TEXT_STYLE,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "5.0" /*gridItem.rattingValue*/,
                            style: RATING_ITEM_TEXT_STYLE,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14.0,
                          )
                        ],
                      ) /*,
                      Text(
                        gridItem.itemSale,
                        style: TextStyle(
                            fontFamily: "Sans",
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.0),
                      )*/
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
