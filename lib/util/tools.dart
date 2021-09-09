//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*waiting(int milliseconds, void Function() callback) async {
  new Timer(Duration(milliseconds: milliseconds), callback);
}*/

redirectTo(BuildContext context, Widget callback) {
  Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => callback));
}
