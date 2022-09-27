import 'package:flutter/material.dart';
import 'package:intrale/comp/buttons/ContainerButton.dart';

abstract class Button extends StatelessWidget {

  final String descriptionKey;
  final void Function() onTap;
  final Color splashColor;
  final EdgeInsetsGeometry padding;
  final double height;
  final double width;
  final AlignmentGeometry alignment;
  final TextStyle style;
  final Decoration decoration;

  Button({required this.descriptionKey, 
          required this.onTap,
          this.splashColor = Colors.white,
          required this.padding,
          required this.height,
          required this.width,
          this.alignment = FractionalOffset.center,
          required this.style,
          required this.decoration});

  @override
  Widget build(BuildContext context) {
    return 
    
    InkWell(
        splashColor: this.splashColor,
        onTap: () {
          this.onTap();
        },
        child: Padding(
          padding: this.padding,
          child: 
          
          ContainerButton(
            decoration: this.decoration,
            height: this.height,
            width: this.width,
            alignment: this.alignment,
            descriptionKey: this.descriptionKey,
            style: this.style,
          )

        ));
  }

}