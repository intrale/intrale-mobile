import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as HTTP;

abstract class Service<Response> {
  Map<String, String> headers;

  String endpoint;
  String function;

  Service({this.endpoint, this.function}) {
    headers = {
      "Content-type": "application/json",
      "Authorization": 'Bearer ' /*+ localStorage.getItem('accessToken')*/,
      "function": function
    };
  }

  Response mapToResponse(Map responseMap);

  Future<Response> post(Object request) async {
    String body = jsonEncode(request);

    debugPrint("INTRALE: Invocando:" + endpoint);
    debugPrint("INTRALE: function:" + function);
    debugPrint("INTRALE: body => \n" + body);

    HTTP.Response response =
        await HTTP.post(endpoint, headers: headers, body: body);

    debugPrint(
        "INTRALE: response statusCode => \n" + response.statusCode.toString());
    debugPrint("INTRALE: response body => \n" + response.body);
    Map responseMap = jsonDecode(response.body);

    return mapToResponse(responseMap);
  }
}
