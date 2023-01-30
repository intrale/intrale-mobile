import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/comp/buttons/SolidButton.dart';
import 'package:intrale/comp/icons/ProvidedIcon.dart';
import 'package:intrale/comp/images/ScaledImage.dart';
import 'package:intrale/comp/texts/TranslatedText.dart';
import 'package:intrale/model/OrderProduct.dart';
import 'package:intrale/scrn/cart/CartItemCard.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intrale/scrn/cart/NoItemCart.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/styles/DecorationStyles.dart';
import 'package:intrale/styles/PaddingStyles.dart';
import 'package:intrale/styles/TextStyles.dart';
import 'package:intrale/util/IntralePreferences.dart';
import 'package:intrale/util/services/delivery/saveorder/SaveOrderRequest.dart';
import 'package:intrale/util/services/delivery/saveorder/SaveOrderService.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesRequest.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesService.dart';
import 'package:intrale/util/services/mercadopago/preferences/Item.dart';
import 'package:intrale/util/services/mercadopago/preferences/Payer.dart';
import 'package:provider/provider.dart';

import 'package:intrale_mobile_mercadopago/intrale_mobile_mercadopago.dart';

const MERCADO_PAGO_CHANNEL = const MethodChannel('intrale.com/mercado_pago');

class CartScreen extends StatefulWidget {
  @override
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {

  SaveOrderService saveOrderService = new SaveOrderService();

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
            title: 
              TranslatedText(textKey: 'cart', style: TextStyles.CART_TITLE),
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
                            top: 1.0, left: 20.0, right: 20.0),

                        /// Background Constructor for card
                        child: Container(
                          height: 220.0,
                          decoration: DecorationStyles.CART_CARD,
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
                                          decoration: DecorationStyles.CART_IMAGE,
                                          child: 
                                          ScaledImage(
                                            path: '/dev/files/get/INTRALE/products/${appState.item(position).id}/main.jpg',
                                            height: 128,
                                            width: 128,
                                          ))),
                                  CartItemCard(position),
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                    alignment: Alignment.bottomRight,
                                    child: 
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            debugPrint('Eliminando del carrito');
                                            appState.removeCartItem(position);
                                          });
                                        },
                                        child: 
                                            ProvidedIcon(
                                              icon:Icons.delete_rounded
                                            )

                                      ))
                                ],
                              ),
                              PaddingStyles.ONLY_TOP_8,
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
                                        style: TextStyles.CART_SUBTOTAL,
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
                ),
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
                                                .getTotalPrice(),
                                        style: TextStyles.CART_SUBTOTAL,
                                      ),
                                    ),
                                  ],
                                ),
                              ),              
                SolidButton(descriptionKey: 'cart_pay', 
                onTap: () {
                    AppState appState = Provider.of<AppState>(context, listen: false);

                    return IntralePreferences().readEmail().then((value) {

                    SaveOrderRequest saveOrderRequest = new SaveOrderRequest(
                      email: value!,
                      deliveryLocation: "Direccion de prueba");
                    saveOrderRequest.products = [];
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
                      item.picture_url = "https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com" + '/dev/files/get/INTRALE/products/${element.id}/main.jpg';
                      request.items!.add(item);


                      OrderProduct orderProduct = OrderProduct(productId: element.id, count: element.count);
                      saveOrderRequest.products!.add(orderProduct);
                    });

                    

                    CheckoutPreferencesService service = CheckoutPreferencesService();
                    request.external_reference = 'Prueba Referencia';

                    Payer payer = Payer();
                    payer.email = value;
                    request.payer = payer;

                    request.notification_url = "https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com/dev/delivery";

                    return service.post(request: request).then((value) => {
                              saveOrderRequest.collectorId = value.collector_id,
                              saveOrderService.post(request: saveOrderRequest),

                              IntraleMobileMercadopago.startPayment(
                                publicKey: 'TEST-aa0147af-3dfc-4172-a474-c7c44a0cd8fa', 
                                preferenceId: value.id!)
                            .then((value) => {
                                  debugPrint("startPayment:" + value.toString()),
                                  Provider.of<AppState>(context, listen: false).cart.items.clear(),
                                  appState.forwardToHomeScreen()
                                })
                        });
                  
                    });
                  
                  
                  }),
                ])
              : NoItemCart());
    });
  }
}
