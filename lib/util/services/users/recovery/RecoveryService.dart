import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/users/recovery/RecoveryResponse.dart';

class RecoveryService extends Service {
  RecoveryService({List<Handler> handlers = DEFAULT_HANDLER_LIST})
      : super(
            endpoint: Endpoints.USERS,
            function: 'passwordRecovery',
            handlers: handlers);

  @override
  mapToResponse(Map<String, dynamic> responseMap) {
    return RecoveryResponse.fromJson(responseMap);
  }
}
