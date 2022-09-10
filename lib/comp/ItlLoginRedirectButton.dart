import 'package:intrale/comp/ItlRedirectButton.dart';

//TODO: Quitar, el redirec se hace directo al path

class ItlLoginRedirectButton extends ItlRedirectButton {
  ItlLoginRedirectButton() : super(textKey: "haveUser", path:'/login');
}
