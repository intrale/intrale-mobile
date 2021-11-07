import 'package:intrale/comp/ItlRedirectButton.dart';
import 'package:intrale/scrn/LoginOrSignup/Login.dart';

class ItlLoginRedirectButton extends ItlRedirectButton {
  ItlLoginRedirectButton() : super(textKey: "haveUser", widget: Login());
}
