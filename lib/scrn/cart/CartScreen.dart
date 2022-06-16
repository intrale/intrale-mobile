import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/scrn/cart/CartItemCard.dart';
import 'package:intrale/scrn/cart/CartPayButton.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intrale/scrn/cart/NoItemCart.dart';
import 'package:intrale/states/AppState.dart';
import 'package:provider/provider.dart';

import 'package:intrale_mobile_mercadopago/intrale_mobile_mercadopago.dart';

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

const MERCADO_PAGO_CHANNEL = const MethodChannel('intrale.com/mercado_pago');

// platform channel method calling
Future<Null> startPayment(
    /*BuildContext context*/ String publicKey, String preferenceId) async {
  IntraleMobileMercadopago.startPayment(
          publicKey: publicKey, preferenceId: preferenceId)
      .then((value) => debugPrint("startPayment:" + value.toString()));
}

class CartScreen extends StatefulWidget {
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  //List<CartItem> items = [];

  @override
  void initState() {
    super.initState();
    /*String? cartString;
    Map<String, dynamic> jsonMap;
    Cart cart = Cart();
    SharedPreferences.getInstance().then((preferences) => {
          cartString = preferences.getString("cart"),
          if (cartString != null)
            {jsonMap = jsonDecode(cartString!), cart = Cart.fromJson(jsonMap)},
          setState(() {
            items = cart.get();
          })
        });*/
  }

  @override
  Widget build(BuildContext context) {
    return /*ChangeNotifierProvider(
        create: (context) => CartState(Cart()),
        child:*/
        Consumer<AppState>(builder: (context, appState, child) {
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
          body: appState.cartLength() > 0
              ? ListView.builder(
                  itemCount: appState.cartLength(),
                  itemBuilder: (context, position) {
                    return Slidable(
                      //delegate: new SlidableDrawerDelegate(),
                      /*actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      actions: <Widget>[
                        new IconSlideAction(
                          caption: 'cartArchiveText',
                          color: Colors.blue,
                          icon: Icons.archive,
                          onTap: () {
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
                          key: Key(appState.item(position).id.toString()),
                          caption: 'cartDelete',
                          color: Colors.red,
                          icon: Icons.delete,
                          onTap: () {
                            setState(() {
                              appState.removeCartItem(position);
                            });

                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('cartDeleted'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.redAccent,
                            ));
                          },
                        ),
                      ],*/
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
                                  CartItemCard(position),
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
                                      padding:
                                          const EdgeInsets.only(left: 10.0),

                                      /// Total price of item buy
                                      child: Text(
                                        FlutterI18n.translate(
                                                context, 'cart_total') +
                                            appState
                                                .item(position)
                                                .getTotalPrice(),
                                        style: TOTAL_TEXT_STYLE,
                                      ),
                                    ),
                                    CartPayButton(),
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
    }) /*)*/;
  }
}
