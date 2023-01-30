import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/delivery/saveorder/SaveOrderResponse.dart';

class SaveOrderService extends Service<SaveOrderResponse> {
  SaveOrderService({List<Handler> handlers = DEFAULT_HANDLER_LIST})
      : super(
            endpoint: Endpoints.DELIVERY, function: 'SaveOrder', handlers: handlers);
  @override
  SaveOrderResponse mapToResponse(Map<String, dynamic> responseMap) {
    return SaveOrderResponse.fromJson(responseMap);
  }
}
