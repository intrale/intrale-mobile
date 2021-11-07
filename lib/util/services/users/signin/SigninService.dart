import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/users/signin/SigninResponse.dart';

class SigninService extends Service<SigninResponse> {
  SigninService({List<Handler> handlers})
      : super(
            endpoint: Endpoints.USERS, function: 'signin', handlers: handlers);
  @override
  SigninResponse mapToResponse(Map responseMap) {
    return SigninResponse.fromJson(responseMap);
  }
}
