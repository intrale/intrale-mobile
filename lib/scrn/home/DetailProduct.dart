import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/comp/carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/model/CartItem.dart';
import 'package:intrale/model/Price.dart';
import 'package:intrale/model/Product.dart';
import 'package:intrale/scrn/home/ChatItem.dart';
import 'package:intrale/scrn/cart/Delivery.dart';
import 'package:intrale/scrn/home/DetailProductCartIcon.dart';
import 'package:intrale/states/CartState.dart';
import 'package:intrale/util/tools.dart';
import 'package:provider/provider.dart';

const TextStyle CUSTOM_TEXT_STYLE = TextStyle(
  color: Colors.black,
  fontFamily: "Gotik",
  fontSize: 17.0,
  fontWeight: FontWeight.w800,
);

const TextStyle SUB_HEADER_CUSTOM_TEXT_STYLE = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w700,
    fontFamily: "Gotik",
    fontSize: 16.0);

const TextStyle DETAIL_TEXT_STYLE = TextStyle(
    fontFamily: "Gotik",
    color: Colors.black54,
    letterSpacing: 0.3,
    wordSpacing: 0.5);

const TextStyle PRODUCT_DETAIL_TEXT_STYLE = TextStyle(
  fontWeight: FontWeight.w500,
  color: Colors.black54,
  fontSize: 17.0,
  fontFamily: "Gotik",
);

const TextStyle VIEW_MORE_TEXT_STYLE = TextStyle(
  color: Colors.indigoAccent,
  fontSize: 15.0,
  fontFamily: "Gotik",
  fontWeight: FontWeight.w700,
);

const TextStyle CART_PAY_TEXT_STYLE =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w700);

class DetailProduct extends StatefulWidget {
  Product gridItem;

  DetailProduct(this.gridItem) {
    debugPrint("Constructor DetailProduct");
  }

  @override
  DetailProductState createState() => DetailProductState(gridItem);
}

/// Detail Product for Recomended Grid in home screen
class DetailProductState extends State<DetailProduct> {
  /// Declaration List item HomeGridItemRe....dart Class
  final Product gridItem;
  DetailProductState(this.gridItem) {
    debugPrint("Constructor DetailProductState");
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartState(Cart()),
        child: Consumer<CartState>(builder: (context, cart, child) {
          return Scaffold(
            key: _key,
            appBar: AppBar(
              actions: <Widget>[
                DetailProductCartIcon(),
              ],
              elevation: 0.5,
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                'productDetail',
                style: PRODUCT_DETAIL_TEXT_STYLE,
              ),
            ),
            body: Column(
              children: <Widget>[
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        /// Header image slider
                        Container(
                          height: 300.0,
                          child: Hero(
                            tag: "hero-grid-${gridItem.id}",
                            child: Material(
                              child: new Carousel(
                                dotColor: Colors.black26,
                                dotIncreaseSize: 1.7,
                                dotBgColor: Colors.transparent,
                                autoplay: false,
                                boxFit: BoxFit.cover,
                                images: [
                                  AssetImage(
                                      "assets/imgItem/fashion1.jpg" /*gridItem.img*/),
                                  AssetImage(
                                      "assets/imgItem/fashion1.jpg" /*gridItem.img*/),
                                  AssetImage(
                                      "assets/imgItem/fashion1.jpg" /*gridItem.img*/),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// Background white title,price and ratting
                        Container(
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                              color: Color(0xFF656565).withOpacity(0.15),
                              blurRadius: 1.0,
                              spreadRadius: 0.2,
                            )
                          ]),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 10.0, right: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  gridItem.name,
                                  style: CUSTOM_TEXT_STYLE,
                                ),
                                Padding(padding: EdgeInsets.only(top: 5.0)),
                                Text(
                                  gridItem.price!.unitPrice.toString(),
                                  style: CUSTOM_TEXT_STYLE,
                                ),
                                Padding(padding: EdgeInsets.only(top: 10.0)),
                                Divider(
                                  color: Colors.black12,
                                  height: 1.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            height: 30.0,
                                            width: 75.0,
                                            decoration: BoxDecoration(
                                              color: Colors.lightGreen,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0)),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "5.0",
                                                  /*gridItem.rattingValue,*/
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.0)),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.white,
                                                  size: 19.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: Text(
                                          "itemSale",
                                          /*gridItem.itemSale,*/
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        /// Background white for description
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            width: 600.0,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Color(0xFF656565).withOpacity(0.15),
                                blurRadius: 1.0,
                                spreadRadius: 0.2,
                              )
                            ]),
                            child: Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, right: 20.0),
                                    child: Text(
                                      'description',
                                      style: SUB_HEADER_CUSTOM_TEXT_STYLE,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15.0,
                                        right: 20.0,
                                        bottom: 10.0,
                                        left: 20.0),
                                    child: Text(gridItem.description,
                                        style: DETAIL_TEXT_STYLE),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 15.0),
                                    child: Center(
                                      child: InkWell(
                                        onTap: () {
                                          /*_bottomSheet();*/
                                        },
                                        child: Text(
                                          'viewMore',
                                          style: VIEW_MORE_TEXT_STYLE,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                /// If user click icon chart SnackBar show
                /// this code to show a SnackBar
                /// and Increase a valueItemChart + 1
                InkWell(
                  onTap: () {
                    var snackbar = SnackBar(
                      content: Text(
                        FlutterI18n.translate(context, 'itemAdded'),
                      ),
                    );

                    cart.add(CartItem(
                        id: gridItem.id,
                        name: gridItem.name,
                        description: gridItem.description,
                        price: Price(
                            currencyAcronym: gridItem.price!.currencyAcronym,
                            unitPrice: gridItem.price!.unitPrice),
                        count: 1));
                    _key.currentState?.showSnackBar(snackbar);
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
                          InkWell(
                            onTap: () {
                              redirectTo(context, chatItem());
                            },
                            child: Container(
                              height: 40.0,
                              width: 60.0,
                              decoration: BoxDecoration(
                                  color: Colors.white12.withOpacity(0.1),
                                  border: Border.all(color: Colors.black12)),
                              child: Center(
                                child: Image.asset("assets/icon/message.png",
                                    height: 20.0),
                              ),
                            ),
                          ),

                          /// Button Pay
                          InkWell(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
