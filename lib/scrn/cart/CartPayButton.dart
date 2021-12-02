import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesRequest.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesService.dart';
import 'package:intrale/util/services/mercadopago/preferences/Item.dart';
import 'package:intrale/util/services/mercadopago/preferences/Payer.dart';
import 'package:intrale_mobile_mercadopago/intrale_mobile_mercadopago.dart';

const TextStyle CART_PAY_TEXT_STYLE = TextStyle(
    color: Colors.white, fontFamily: "Sans", fontWeight: FontWeight.w600);

class CartPayButton extends StatefulWidget {
  @override
  CartPayButtonState createState() => CartPayButtonState();
}

class CartPayButtonState extends State<CartPayButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CheckoutPreferencesService service = CheckoutPreferencesService();
        Item item = Item();
        item.id = '1';
        item.title = 'Producto 1';
        item.description = 'Prueba';
        item.quantity = 1;
        item.currency_id = "\$";
        item.unit_price = 200;
        CheckoutPreferencesRequest request = CheckoutPreferencesRequest();
        request.items = [item];
        Payer payer = Payer();
        payer.email = 'mail@mail.com';
        request.payer = payer;

        service.post(request: request).then((value) => {
              startPayment(
                  'TEST-aa0147af-3dfc-4172-a474-c7c44a0cd8fa', value.id)
            });

        /*Navigator.of(context).push(
                                          PageRouteBuilder(
                                              pageBuilder: (_, __, ___) =>
                                                  delivery()));*/
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

  Future<Null> startPayment(
      /*BuildContext context*/ String publicKey, String preferenceId) async {
    IntraleMobileMercadopago.startPayment(
            publicKey: publicKey, preferenceId: preferenceId)
        .then((value) => debugPrint("startPayment:" + value.toString()));
  }
}
