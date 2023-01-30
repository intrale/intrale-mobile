import 'package:flutter/material.dart';
import 'package:intrale/comp/icons/ProvidedIcon.dart';
import 'package:intrale/scrn/cart/CartItemIncrease.dart';
import 'package:intrale/states/AppState.dart';

class CartItemDecrease extends CartItemIncrease {
  CartItemDecrease(position) : super(position);

  @override
  void action(AppState appState) {
    appState.decrease(position);
  }

  @override
  Widget button() {
    return ProvidedIcon(
                            icon:Icons.remove_circle
                          );
  }
}
