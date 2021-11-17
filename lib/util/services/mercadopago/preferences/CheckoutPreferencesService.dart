import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/mercadopago/preferences/CheckoutPreferencesResponse.dart';

class CheckoutPreferencesService extends Service<CheckoutPreferencesResponse> {
  CheckoutPreferencesService()
      : super(endpoint: Endpoints.MP_PREFERENCES, function: '');

  @override
  CheckoutPreferencesResponse mapToResponse(Map<String, dynamic> responseMap) {
    return CheckoutPreferencesResponse.fromJson(responseMap);
  }
}
