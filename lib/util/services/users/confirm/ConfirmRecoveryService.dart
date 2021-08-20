import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/users/confirm/ConfirmRecoveryResponse.dart';

class ConfirmRecoveryService extends Service {
  ConfirmRecoveryService()
      : super(endpoint: Endpoints.USERS, function: 'confirmPasswordRecovery');

  @override
  mapToResponse(Map responseMap) {
    return ConfirmRecoveryResponse.fromJson(responseMap);
  }
}
