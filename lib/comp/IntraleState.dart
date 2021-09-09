import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intrale/const/TextStyleConst.dart';
import 'package:intrale/scrn/LoginOrSignup/Confirm.dart';
import 'package:intrale/scrn/LoginOrSignup/Login.dart';
import 'package:intrale/scrn/LoginOrSignup/Recovery.dart';
import 'package:intrale/scrn/LoginOrSignup/Signup.dart';
import 'package:intrale/util/tools.dart';

abstract class IntraleState<T extends StatefulWidget> extends State<T>
    with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();

  // Texts declarations
  Text title;
  Text notHave;
  Text missing;
  Text haveCode;
  Text haveUser;

  // Buttons declarations
  TextButton notHaveButton;
  TextButton missingButton;
  TextButton haveCodeButton;
  TextButton haveUserButton;

  // Images declarations
  Image logo;

  // Other Components declarations
  Hero hero;
  Row header;
  MediaQueryData mediaQueryData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Texts, Fields & Services initializations
    title = Text(
      AppLocalizations.of(context).businessName,
      textDirection: TextDirection.ltr,
      style: LOGIN_TITLE_TEXT,
    );

    notHave = Text(
      AppLocalizations.of(context).notHave,
      textDirection: TextDirection.ltr,
      style: LOGIN_ALTERNATIVE_BUTTONS,
    );

    missing = Text(
      AppLocalizations.of(context).missing,
      textDirection: TextDirection.ltr,
      style: LOGIN_ALTERNATIVE_BUTTONS,
    );

    haveCode = Text(
      AppLocalizations.of(context).haveCode,
      textDirection: TextDirection.ltr,
      style: LOGIN_ALTERNATIVE_BUTTONS,
    );

    haveUser = Text(
      AppLocalizations.of(context).haveUser,
      textDirection: TextDirection.ltr,
      style: LOGIN_ALTERNATIVE_BUTTONS,
    );

    notHaveButton = TextButton(
        onPressed: () {
          redirectTo(context, new Signup());
        },
        child: notHave);

    missingButton = TextButton(
        onPressed: () {
          redirectTo(context, new Recovery());
        },
        child: missing);

    haveCodeButton = TextButton(
        onPressed: () {
          redirectTo(context, new Confirm());
        },
        child: haveCode);

    haveUserButton = TextButton(
        onPressed: () {
          redirectTo(context, new Login());
        },
        child: haveUser);

    logo = Image(
      image: AssetImage("assets/img/Logo.png"),
      height: 70.0,
    );

    hero = Hero(
      tag: "Intrale",
      child: title,
    );

    header = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        logo,
        Padding(padding: EdgeInsets.all(10)),
        hero,
      ],
    );

    mediaQueryData = new MediaQueryData();

    // Texts initializations
    textsInitializations();

    // Fields initializations
    fieldsInitializations();

    // Services initializations
    servicesInitializations();

    // Buttons initializations
    buttonsInitializations();

    // Images initializations
    imagesInitializations();

    // Other Components initializations
    othersInitializations();
  }

  void textsInitializations();
  void fieldsInitializations();
  void servicesInitializations();
  void buttonsInitializations();
  void imagesInitializations();
  void othersInitializations();
}
