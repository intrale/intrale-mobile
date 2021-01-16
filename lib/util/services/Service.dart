import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as HTTP;

abstract class Service<Response> {
  static Map<String, String> headers = {"Content-type": "application/json"};

  String endpoint;

  Service({this.endpoint}) {}

  Response mapToResponse(Map responseMap);

  Future<Response> post(Object request) async {
    String body = jsonEncode(request);

    debugPrint("INTRALE: Invocando:" + endpoint);
    debugPrint("INTRALE: body => \n" + body);

    HTTP.Response response =
        await HTTP.post(endpoint, headers: headers, body: body);

    /*if (response.statusCode != 200) {
      debugPrint('Service return exception ');
      throw new Exception(response);

    }*/
    debugPrint("INTRALE: response => \n" + response.body);
    Map responseMap = jsonDecode(response.body);
    //responseMap.putIfAbsent('statusCode', () => response.statusCode);

    return mapToResponse(responseMap);
  }
}
