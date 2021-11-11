import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/products/read/ReadProductsResponse.dart';

class ReadProductsService extends Service<ReadProductsResponse> {
  ReadProductsService() : super(endpoint: Endpoints.PRODUCTS, function: 'read');

  @override
  ReadProductsResponse mapToResponse(Map<String, dynamic> responseMap) {
    return ReadProductsResponse.fromJson(responseMap);
  }
}
