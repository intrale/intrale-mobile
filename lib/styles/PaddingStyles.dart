import 'package:flutter/cupertino.dart';

class PaddingStyles {

  const PaddingStyles();

  static const Padding EDGE_INSETS_ALL_1 = Padding(padding: EdgeInsets.all(1));
  static const Padding EDGE_INSETS_ALL_3 = Padding(padding: EdgeInsets.all(3));
  static const Padding EDGE_INSETS_ALL_5 = Padding(padding: EdgeInsets.all(5));
  static const Padding EDGE_INSETS_ALL_7 = Padding(padding: EdgeInsets.all(7));
  static const Padding EDGE_INSETS_ALL_10 = Padding(padding: EdgeInsets.all(10));
  static const Padding EDGE_INSETS_ALL_30 = Padding(padding: EdgeInsets.all(10));

  static const Padding ONLY_TOP_8 = Padding(padding: EdgeInsets.only(top: 8));
  static const Padding ONLY_TOP_30 = Padding(padding: EdgeInsets.only(top: 30.0));
  static const Padding ONLY_TOP_250 = Padding(padding: EdgeInsets.only(top: 250.0));

  static const Padding ONLY_LEFT_17 = Padding(padding: EdgeInsets.only(left: 17));

  static const Padding BOTH_SIDES_10 = Padding(padding: EdgeInsets.only(left: 10.0, right: 10.0));

  static const Padding CART = Padding(padding: EdgeInsets.only(top: 1.0, left: 13.0, right: 13.0));

}