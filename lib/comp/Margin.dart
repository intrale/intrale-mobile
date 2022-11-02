

import 'package:flutter/material.dart';

class Margin extends StatelessWidget {

  final Widget child;
  final double left;
  final double right;
  final double top;
  final double bottom;

  Margin({required this.child,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
          child: child);
  }
}