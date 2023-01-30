import 'package:flutter/material.dart';

class DecorationStyles {

  const DecorationStyles();

  static const BorderRadius CIRCULAR_30 = BorderRadius.all(Radius.circular(30));

  static const BorderSide WHITE_BORDERS = BorderSide(color: Colors.white, width: 1.0, style: BorderStyle.solid);

  static const BoxDecoration GRADIENT_BLACK = BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Color.fromRGBO(0, 0, 0, 0.3),
              Color.fromRGBO(0, 0, 0, 0.4)
            ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter));

  static const BoxDecoration SOLID_BUTTON = BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
                borderRadius: CIRCULAR_30,
                gradient: LinearGradient(
                    colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)]));

  static const BoxDecoration SECUNDARY_SOLID_BUTTON = BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
                borderRadius: CIRCULAR_30,
                gradient: LinearGradient(
                    colors: <Color>[Color.fromARGB(255, 39, 42, 62), Color.fromARGB(255, 143, 127, 169)]));

  static const BoxDecoration TRANSPARENT_BUTTON = BoxDecoration(
                borderRadius: CIRCULAR_30,
                color: Colors.transparent,
                border: Border.fromBorderSide(WHITE_BORDERS));

  static const BoxDecoration LINK_BUTTON = BoxDecoration(
                color: Colors.transparent,
                );
  
  static const BoxDecoration ITEM_GRID = BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF656565), /*.withOpacity(0.15),*/
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  //offset: Offset(4.0, 10.0)
                )
              ]);


  static const BoxDecoration CART_CARD = BoxDecoration(color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12/*.withOpacity(0.1)*/,
                                blurRadius: 3.5,
                                spreadRadius: 0.4,
                              )
                            ]);

  static const BoxDecoration CART_IMAGE = BoxDecoration(
                                              color:
                                                  Colors.white/*.withOpacity(0.1)*/,
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12
                                                        /*.withOpacity(0.1)*/,
                                                    blurRadius: 0.5,
                                                    spreadRadius: 0.1)
                                              ]);
}