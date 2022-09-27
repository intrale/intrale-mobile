
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intrale/comp/ItlHeader.dart';
import 'package:intrale/comp/ItlLogo.dart';
import 'package:intrale/comp/buttons/Button.dart';
import 'package:intrale/comp/buttons/LinkButton.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Response.dart';
import 'package:intrale/util/services/StatusCodes.dart';

//TODO: Mejorar uso de handlers
abstract class IntraleState<T extends StatefulWidget> extends State<T>
    with TickerProviderStateMixin {
      
  final formKey = GlobalKey<FormState>();

  // Buttons declarations
  late Button notHaveButton;
  late Button missingButton;
  late Button haveCodeButton;
  late Button haveUserButton;

  // Images declarations
  ItlLogo logo = ItlLogo();

  // Other Components declarations
  ItlHeader header = ItlHeader();
  MediaQueryData mediaQueryData = new MediaQueryData();

  Handler? okHandler;
  Handler? errorHandler;

  IntraleState() {
    notHaveButton = LinkButton(descriptionKey: "notHave", onTap: ()=> context.go('/signup'));
    missingButton = LinkButton(descriptionKey: "missing", onTap: ()=> context.go('/recovery'));
    haveCodeButton = LinkButton(descriptionKey: "haveCode", onTap: ()=> context.go('/confirm'));
    haveUserButton = LinkButton(descriptionKey: "haveUser", onTap: ()=> context.go('/login'));

    okHandler = Handler(
        statusCode: STATUS_CODE_OK, function: (response) => onOk(response));

    errorHandler =
        Handler(statusCode: 0, function: (response) => onError(response));
  }

  Padding mediaQueryTopPadding(double top) => topPadding(mediaQueryData.padding.top + top);

  Padding topPadding(double top) => Padding(
                padding:
                    EdgeInsets.only(top: top));
  

  void onOk(Response response) {}
  void onError(Response response) {}

  onSubmit() {
    debugPrint('IntraleState onSubmit');
    bool valid = formKey.currentState?.validate() ?? false;
    if (valid) {
      formKey.currentState?.save();
      onValidSubmit();
    }
  }

  onValidSubmit() {}
}
