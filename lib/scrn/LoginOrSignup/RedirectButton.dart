import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RedirectButton extends StatelessWidget {
  final String txt;
  final String path;

  RedirectButton({required this.txt, required this.path});

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.go(this.path);
        },
        splashColor: Colors.white,
        child: LayoutBuilder(builder: (context, constraint) {
          return Container(
            width: 300.0,
            height: 52.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.transparent,
                border: Border.all(color: Colors.white)),
            child: Center(
                child: TextButton(
                    onPressed: () {
                      context.go(this.path);
                    },
                    child: Text(
                      txt,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Sans",
                          letterSpacing: 0.5),
                    ))),
          );
        }),
      ),
    );
  }
}
