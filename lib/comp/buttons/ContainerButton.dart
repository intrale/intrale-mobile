import 'package:flutter/material.dart';
import 'package:intrale/comp/ItlText.dart';

class ContainerButton extends StatelessWidget {

  final String descriptionKey;
  final double height;
  final double width;
  final AlignmentGeometry alignment;
  final TextStyle style;
  final Decoration decoration;

  ContainerButton({
                    required this.descriptionKey,
                    required this.height,
                    required this.width,
                    this.alignment = FractionalOffset.center,
                    required this.style,
                    required this.decoration
                  }){}

  @override
  Widget build(BuildContext context) {
    return Container(
            decoration: this.decoration,
            height: this.height,
            width: this.width,
            alignment: this.alignment,
            child: ItlText (
              textKey: this.descriptionKey,
              style: this.style,
            ));

  }
  
}