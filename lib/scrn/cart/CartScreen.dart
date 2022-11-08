import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/comp/buttons/SolidButton.dart';
import 'package:intrale/comp/images/CachedImage.dart';
import 'package:intrale/comp/images/ScaledImage.dart';
import 'package:intrale/scrn/cart/CartItemCard.dart';
import 'package:intrale/scrn/cart/CartPayButton.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intrale/scrn/cart/NoItemCart.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesRequest.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesService.dart';
import 'package:intrale/util/services/mercadopago/preferences/Item.dart';
import 'package:intrale/util/services/mercadopago/preferences/Payer.dart';
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
/*Future<Null> startPayment(
    String publicKey, String preferenceId) async {
  IntraleMobileMercadopago.startPayment(
          publicKey: publicKey, preferenceId: preferenceId)
      .then((value) => debugPrint("startPayment:" + value.toString()));
}*/


class CartScreen extends StatefulWidget {
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
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
              ? ListView(children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: appState.cartLength(),
                  itemBuilder: (context, position) {
                    return Slidable(
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
                          child: 
                          ListView(
                            shrinkWrap: true,
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
                                          child: 
                                          ScaledImage(
                                            path: '/dev/files/get/INTRALE/products/${appState.item(position).id}/main.jpg',
                                            height: 64,
                                            width: 64,
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
                                                context, 'cart_subtotal') +
                                            appState
                                                .item(position)
                                                .getTotalPrice(),
                                        style: TOTAL_TEXT_STYLE,
                                      ),
                                    ),
                                    //CartPayButton(),
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
                ),
                SolidButton(descriptionKey: 'cart_pay', 
                onTap: () {
                    AppState appState = Provider.of<AppState>(context, listen: false);

                    CheckoutPreferencesService service = CheckoutPreferencesService();

                    CheckoutPreferencesRequest request = CheckoutPreferencesRequest();
                    request.items = [];
                    appState.cart.items.forEach((element) {
                      Item item = Item();
                      item.id = element.id;
                      item.title = element.name;
                      item.description = element.description;
                      item.quantity = element.count;
                      item.currency_id = element.price.currencyAcronym;
                      item.unit_price = element.price.unitPrice;
                      request.items!.add(item);
                    });

                    /*Item item = Item();
                    item.id = '1';
                    item.title = 'Producto 1';
                    item.description = 'Prueba';
                    item.quantity = 1;
                    item.currency_id = "\$";

                    item.unit_price = 200;*/

                    Payer payer = Payer();
                    payer.email = 'mail@mail.com';
                    request.payer = payer;

                    return service.post(request: request).then((value) => {
                              IntraleMobileMercadopago.startPayment(
                                publicKey: 'TEST-aa0147af-3dfc-4172-a474-c7c44a0cd8fa', 
                                preferenceId: value.id!)
                            .then((value) => {
                                  debugPrint("startPayment:" + value.toString()),
                                  Provider.of<AppState>(context, listen: false).cart.items.clear(),
                                  appState.forwardToHomeScreen()
                                })
                          /*startPayment(
                              'TEST-aa0147af-3dfc-4172-a474-c7c44a0cd8fa', value.id!)*/
                        });
                  }),
                
                //CartPayButton()
                ])
              : NoItemCart());
    });
  }
}
