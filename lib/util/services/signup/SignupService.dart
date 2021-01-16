import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/signup/SignupResponse.dart';

class SignupService extends Service {
  SignupService() : super(endpoint: Endpoints.SIGNUP);

  @override
  mapToResponse(Map responseMap) {
    return SignupResponse.fromJson(responseMap);
  }
}
