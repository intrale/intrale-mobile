import 'package:uuid/uuid.dart';

class Request {
  String businessName = 'INTRALE';
  String requestId = Uuid().v4();

  Request() {}
}
