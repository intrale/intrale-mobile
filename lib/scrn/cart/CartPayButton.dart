import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/states/AppState.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesRequest.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesService.dart';
import 'package:intrale/util/services/mercadopago/preferences/Item.dart';
import 'package:intrale/util/services/mercadopago/preferences/Payer.dart';
import 'package:intrale_mobile_mercadopago/intrale_mobile_mercadopago.dart';
import 'package:provider/provider.dart';

const TextStyle CART_PAY_TEXT_STYLE = TextStyle(
    color: Colors.white, fontFamily: "Sans", fontWeight: FontWeight.w600);

class CartPayButton extends StatefulWidget {
  @override
  CartPayButtonState createState() => CartPayButtonState();
}
//TODO: Revisar si es necesario este componente
class CartPayButtonState extends State<CartPayButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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

        service.post(request: request).then((value) => {
              startPayment(
                  'TEST-aa0147af-3dfc-4172-a474-c7c44a0cd8fa', value.id!)
            });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Container(
          height: 40.0,
          width: 120.0,
          decoration: BoxDecoration(
            color: Color(0xFFA3BDED),
          ),
          child: Center(
            child: Text(
              FlutterI18n.translate(context, 'cart_pay'),
              style: CART_PAY_TEXT_STYLE,
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> startPayment(String publicKey, String preferenceId) async {
    IntraleMobileMercadopago.startPayment(
            publicKey: publicKey, preferenceId: preferenceId)
        .then((value) => {
              debugPrint("startPayment:" + value.toString()),
              Provider.of<AppState>(context, listen: false).cart.items.clear()
            });
  }
}
