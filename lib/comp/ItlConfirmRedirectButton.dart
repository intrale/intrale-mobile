import 'package:intrale/comp/ItlRedirectButton.dart';
import 'package:intrale/scrn/LoginOrSignup/Confirm.dart';

class ItlConfirmRedirectButton extends ItlRedirectButton {
  ItlConfirmRedirectButton() : super(textKey: "haveCode", widget: Confirm());
}