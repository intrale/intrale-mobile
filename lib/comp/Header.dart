import 'package:flutter/material.dart';
import 'package:intrale/comp/ItlLogo.dart';
import 'package:intrale/comp/texts/TranslatedText.dart';
import 'package:intrale/styles/PaddingStyles.dart';
import 'package:intrale/styles/TextStyles.dart';

class Header extends Row {
  Header()
      : super(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ItlLogo(),
            PaddingStyles.EDGE_INSETS_ALL_10,
            Hero(
              tag: "Intrale",
              child: TranslatedText(textKey: "businessName", style: TextStyles.TITLE),
            )
          ],
        );
}
