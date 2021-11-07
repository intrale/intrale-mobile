import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/users/recovery/RecoveryResponse.dart';

class RecoveryService extends Service {
  RecoveryService({List<Handler> handlers})
      : super(
            endpoint: Endpoints.USERS,
            function: 'passwordRecovery',
            handlers: handlers);

  @override
  mapToResponse(Map responseMap) {
    return RecoveryResponse.fromJson(responseMap);
  }
}
