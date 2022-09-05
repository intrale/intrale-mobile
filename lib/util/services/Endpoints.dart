import 'package:intrale/comp/ItlCustom.dart';

//TODO: Evaluar si esto deberia estar en ItlCustom para no correr el riesgo de utilizar urls antes de estar disponibles
class Endpoints {
  static final String NOTIFICATIONS = ItlCustom.instance.custom.api_url + "/notifications";
  static final String USERS = ItlCustom.instance.custom.api_url + "/users";
  static final String PRODUCTS =
      "https://mgnr0htbvd.execute-api.us-east-2.amazonaws.com/dev/products";
  static final String MP_PREFERENCES =
      "https://api.mercadopago.com/checkout/preferences?access_token=TEST-1312279043000238-022814-1d748dae4d4bd2c7a8a1b7a0e6044fe7-83892950";
}
