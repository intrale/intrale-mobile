import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/Service.dart';

class SaveNotificationTokenService extends Service<Response> {
  SaveNotificationTokenService({List<Handler> handlers = DEFAULT_HANDLER_LIST}) 
    : super(endpoint: Endpoints.NOTIFICATIONS, function: 'save', handlers: handlers);

  @override
  Response mapToResponse(Map<String, dynamic> responseMap) {
    return Response.fromJson(responseMap);
  }
}
