import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/users/signin/SigninResponse.dart';

class SigninService extends Service<SigninResponse> {
  SigninService({List<Handler> handlers = DEFAULT_HANDLER_LIST})
      : super(
            endpoint: Endpoints.USERS, function: 'signin', handlers: handlers);
  @override
  SigninResponse mapToResponse(Map<String, dynamic> responseMap) {
    return SigninResponse.fromJson(responseMap);
  }
}
