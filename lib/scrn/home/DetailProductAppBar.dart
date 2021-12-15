import 'package:flutter/material.dart';
import 'package:intrale/scrn/home/DetailProductCartIcon.dart';

const TextStyle PRODUCT_DETAIL_TEXT_STYLE = TextStyle(
  fontWeight: FontWeight.w500,
  color: Colors.black54,
  fontSize: 17.0,
  fontFamily: "Gotik",
);

class DetailProductAppBar extends AppBar {
  DetailProductAppBar()
      : super(
          actions: <Widget>[
            DetailProductCartIcon(),
          ],
          elevation: 0.5,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'productDetail',
            style: PRODUCT_DETAIL_TEXT_STYLE,
          ),
        );
}
