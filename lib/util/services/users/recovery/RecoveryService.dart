import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/users/recovery/RecoveryResponse.dart';

class RecoveryService extends Service {
  RecoveryService()
      : super(endpoint: Endpoints.USERS, function: 'passwordRecovery');

  @override
  mapToResponse(Map responseMap) {
    return RecoveryResponse.fromJson(responseMap);
  }
}
