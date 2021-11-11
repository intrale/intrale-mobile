import 'package:flutter/material.dart';
import 'package:intrale/const/TextStyleConst.dart';

class IntraleButton extends StatelessWidget {
  final String description;
  Function() onTap;

  IntraleButton({required this.description, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.yellow,
        onTap: () {
          this.onTap();
        },
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Container(
            height: 55.0,
            width: 600.0,
            child: Text(
              this.description,
              style: INTRALE_BUTTON,
            ),
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
                borderRadius: BorderRadius.circular(30.0),
                gradient: LinearGradient(
                    colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
          ),
        ));
  }
}
