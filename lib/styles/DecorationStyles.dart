import 'package:flutter/material.dart';

class DecorationStyles {

  BoxDecoration GRADIENT_BLACK = BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color.fromRGBO(0, 0, 0, 0.3),
              Color.fromRGBO(0, 0, 0, 0.4)
            ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter));

  BoxDecoration SOLID_BUTTON = BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                    colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)]));

  BoxDecoration TRANSPARENT_BUTTON = BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.transparent,
                border: Border.all(color: Colors.white));

  BoxDecoration LINK_BUTTON = BoxDecoration(
                color: Colors.transparent,
                );

}