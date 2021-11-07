import 'package:flutter/material.dart';

class ItlFields extends Column {
  ItlFields({List<Widget> children})
      : super(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: children))
            ]);
}
