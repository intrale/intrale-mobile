import 'package:intrale/comp/ItlRedirectButton.dart';
import 'package:intrale/scrn/LoginOrSignup/Signup.dart';

class ItlSignupRedirectButton extends ItlRedirectButton {
  ItlSignupRedirectButton() : super(textKey: "notHave", widget: Signup());
}
