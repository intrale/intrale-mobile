import 'package:intrale/util/services/Endpoints.dart';
import 'package:intrale/util/services/Service.dart';
import 'package:intrale/util/services/signin/SigninResponse.dart';

class SigninService extends Service<SigninResponse> {
  SigninService() : super(endpoint: Endpoints.SIGNIN);
  @override
  SigninResponse mapToResponse(Map responseMap) {
    return SigninResponse.fromJson(responseMap);
  }
}
