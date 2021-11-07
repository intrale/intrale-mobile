import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/users/confirm/ConfirmRecoveryResponse.dart';

class ConfirmRecoveryService extends Service {
  ConfirmRecoveryService({List<Handler> handlers})
      : super(
            endpoint: Endpoints.USERS,
            function: 'confirmPasswordRecovery',
            handlers: handlers);

  @override
  mapToResponse(Map responseMap) {
    return ConfirmRecoveryResponse.fromJson(responseMap);
  }
}
