import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/users/signup/SignupResponse.dart';

class SignupService extends Service<SignupResponse> {
  SignupService({List<Handler> handlers})
      : super(
            endpoint: Endpoints.USERS, function: 'signup', handlers: handlers);

  @override
  SignupResponse mapToResponse(Map responseMap) {
    return SignupResponse.fromJson(responseMap);
  }
}
