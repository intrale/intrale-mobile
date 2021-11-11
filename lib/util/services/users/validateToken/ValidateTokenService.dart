import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/Service.dart';

class ValidateTokenService extends Service {
  ValidateTokenService()
      : super(endpoint: Endpoints.USERS, function: 'validateToken');

  @override
  Response mapToResponse(Map<String, dynamic> responseMap) {
    return Response.fromJson(responseMap);
  }
}
