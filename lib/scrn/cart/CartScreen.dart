import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/model/Cart.dart';
import 'package:intrale/model/CartItem.dart';
import 'package:intrale/scrn/cart/Delivery.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intrale/scrn/cart/NoItemCart.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesRequest.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesService.dart';
import 'package:intrale/util/services/mercadopago/preferences/Item.dart';
import 'package:intrale/util/services/mercadopago/preferences/Payer.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TextStyle TITLE_TEXT_STYLE = TextStyle(
    fontFamily: "Gotik",
    fontSize: 18.0,
    color: Colors.black54,
    fontWeight: FontWeight.w700);

const TextStyle CART_PAY_TEXT_STYLE = TextStyle(
    color: Colors.white, fontFamily: "Sans", fontWeight: FontWeight.w600);

const TextStyle TOTAL_TEXT_STYLE = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 15.5,
    fontFamily: "Sans");

const MERCADO_PAGO_CHANNEL = const MethodChannel('intrale.com/mercado_pago');

// platform channel method calling
Future<Null> startPayment(
    /*BuildContext context*/ String? publicKey, String? preferenceId) async {
  try {
    final String result = await MERCADO_PAGO_CHANNEL.invokeMethod(
        'startPayment', // call the native function
        <String, dynamic>{
          "publicKey": publicKey,
          "preferenceId": preferenceId
        });
    // result hold the response from plaform calls
  } on PlatformException catch (error) {
    // handle error
    print('Error: $error'); // here
  }
}

class CartScreen extends StatefulWidget {
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  List<CartItem> items = [];

  @override
  void initState() {
    super.initState();
    String? cartString;
    Map<String, dynamic> jsonMap;
    Cart cart = Cart();
    SharedPreferences.getInstance().then((preferences) => {
          cartString = preferences.getString("cart"),
          if (cartString != null)
            {jsonMap = jsonDecode(cartString!), cart = Cart.fromJson(jsonMap)},
          setState(() {
            items = cart.items;
          })
        });
  }

  /// Declare price and value for chart
  //int value = 1;
  //int pay = 950;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xFF6991C7)),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            FlutterI18n.translate(context, 'cart'),
            style: TITLE_TEXT_STYLE,
          ),
          elevation: 0.0,
        ),

        ///
        ///
        /// Checking item value of cart
        ///
        ///
        body: items.length > 0
            ? ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, position) {
                  ///
                  /// Widget for list view slide delete
                  ///
                  return Slidable(
                    //delegate: new SlidableDrawerDelegate(),
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    actions: <Widget>[
                      new IconSlideAction(
                        caption: 'cartArchiveText',
                        color: Colors.blue,
                        icon: Icons.archive,
                        onTap: () {
                          ///
                          /// SnackBar show if cart Archive
                          ///
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('cartArchice'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.blue,
                          ));
                        },
                      ),
                    ],
                    secondaryActions: <Widget>[
                      new IconSlideAction(
                        key: Key(items[position].id.toString()),
                        caption: 'cartDelete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () {
                          setState(() {
                            items.removeAt(position);
                          });

                          ///
                          /// SnackBar show if cart delet
                          ///
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('cartDeleted'),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.redAccent,
                          ));
                        },
                      ),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 1.0, left: 13.0, right: 13.0),

                      /// Background Constructor for card
                      child: Container(
                        height: 220.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.1),
                              blurRadius: 3.5,
                              spreadRadius: 0.4,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.all(10.0),

                                    /// Image item
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.1),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12
                                                      .withOpacity(0.1),
                                                  blurRadius: 0.5,
                                                  spreadRadius: 0.1)
                                            ]),
                                        child: Image.asset(
                                          //'${items[position].id}', //deberia ir la imagen del producto
                                          'assets/imgItem/fashion1.jpg',
                                          height: 130.0,
                                          width: 120.0,
                                          fit: BoxFit.cover,
                                        ))),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25.0, left: 10.0, right: 5.0),
                                    child: Column(
                                      /// Text Information Item
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${items[position].name}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Sans",
                                            color: Colors.black87,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(top: 10.0)),
                                        Text(
                                          '${items[position].description}',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(top: 10.0)),
                                        Text(
                                            '${items[position].price.unitPrice}'),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 18.0, left: 0.0),
                                          child: Container(
                                            width: 112.0,
                                            decoration: BoxDecoration(
                                                color: Colors.white70,
                                                border: Border.all(
                                                    color: Colors.black12
                                                        .withOpacity(0.1))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                /// Decrease of value item
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (items[position]
                                                              .count >
                                                          1) {
                                                        items[position].count =
                                                            (items[position]
                                                                    .count -
                                                                1);
                                                      }
                                                      //pay = 950 * value;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 30.0,
                                                    width: 30.0,
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            right: BorderSide(
                                                                color: Colors
                                                                    .black12
                                                                    .withOpacity(
                                                                        0.1)))),
                                                    child: Center(
                                                        child: Text("-")),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 18.0),
                                                  child: Text(items[position]
                                                      .count
                                                      .toString()),
                                                ),

                                                /// Increasing value of item
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      items[position].count =
                                                          (items[position]
                                                                  .count +
                                                              1);
                                                      //pay = 950 * value;
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 30.0,
                                                    width: 28.0,
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            left: BorderSide(
                                                                color: Colors
                                                                    .black12
                                                                    .withOpacity(
                                                                        0.1)))),
                                                    child: Center(
                                                        child: Text("+")),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 8.0)),
                            Divider(
                              height: 2.0,
                              color: Colors.black12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 9.0, left: 10.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),

                                    /// Total price of item buy
                                    child: Text(
                                      FlutterI18n.translate(
                                              context, 'cart_total') +
                                          items[position]
                                              .price
                                              .currencyAcronym +
                                          (items[position].price.unitPrice *
                                                  items[position].count)
                                              .toString(),
                                      style: TOTAL_TEXT_STYLE,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      CheckoutPreferencesService service =
                                          CheckoutPreferencesService();
                                      Item item = Item();
                                      item.id = '1';
                                      item.title = 'Producto 1';
                                      item.description = 'Prueba';
                                      item.quantity = 1;
                                      item.currency_id = "\$";
                                      item.unit_price = 200;
                                      CheckoutPreferencesRequest request =
                                          CheckoutPreferencesRequest();
                                      request.items = [item];
                                      Payer payer = Payer();
                                      payer.email = 'mail@mail.com';
                                      request.payer = payer;

                                      service.post(request: request).then(
                                          (value) => {
                                                startPayment(
                                                    'publicKey', value.id)
                                              });

                                      /*Navigator.of(context).push(
                                          PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  delivery()));*/
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Container(
                                        height: 40.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFA3BDED),
                                        ),
                                        child: Center(
                                          child: Text(
                                            FlutterI18n.translate(
                                                context, 'cart_pay'),
                                            style: CART_PAY_TEXT_STYLE,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                scrollDirection: Axis.vertical,
              )
            : NoItemCart());
  }
}
