import 'package:flutter/material.dart';
import 'package:intrale/comp/ItlLogo.dart';
import 'package:intrale/comp/ItlText.dart';
import 'package:intrale/const/TextStyleConst.dart';

class ItlHeader extends Row {
  ItlHeader()
      : super(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ItlLogo(),
            Padding(padding: EdgeInsets.all(10)),
            Hero(
              tag: "Intrale",
              child: ItlText(textKey: "businessName", style: TITLE),
            )
          ],
        );
}
