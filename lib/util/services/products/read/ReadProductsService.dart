import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/products/read/ReadProductsResponse.dart';

class ReadProductsService extends Service<ReadProductsResponse> {
  ReadProductsService({List<Handler> handlers = DEFAULT_HANDLER_LIST}) 
    : super(endpoint: Endpoints.PRODUCTS, function: 'read', handlers: handlers);

  @override
  ReadProductsResponse mapToResponse(Map<String, dynamic> responseMap) {
    return ReadProductsResponse.fromJson(responseMap);
  }
}
