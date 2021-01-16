import 'package:intrale/util/services/Error.dart';

class Response {
  int statusCode;
  List<Error> errors;

  Response({this.statusCode, this.errors}){}
}
