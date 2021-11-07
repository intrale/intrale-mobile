import 'package:flutter/cupertino.dart';
import 'package:intrale/util/services/Response.dart';

class Handler {
  int statusCode;

  void Function(Response response) function;

  Handler({@required this.statusCode, @required this.function});

  void execute(Response response) {
    function(response);
  }
}
