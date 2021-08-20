import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/users/signup/SignupResponse.dart';

class SignupService extends Service {
  SignupService() : super(endpoint: Endpoints.USERS, function: 'signup');

  @override
  SignupResponse mapToResponse(Map responseMap) {
    return SignupResponse.fromJson(responseMap);
  }
}
