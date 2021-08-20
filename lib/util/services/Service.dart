import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as HTTP;

import 'package:shared_preferences/shared_preferences.dart';

abstract class Service<Response> {
  bool initialized = false;

  Map<String, String> headers;

  String endpoint;
  String function;

  Future initializeHeaders() async {
    if (this.headers != null) {
      return;
    }
    debugPrint('Inicializando Servicio');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String accessToken = '';
    String idToken = '';

    if (sharedPreferences.containsKey('accessToken')) {
      accessToken = sharedPreferences.getString('accessToken');
    }
    if (sharedPreferences.containsKey('idToken')) {
      idToken = sharedPreferences.getString('idToken');
    }

    this.headers = {
      'Content-type': 'application/json',
      'Authorization': accessToken,
      'idtoken': idToken,
      'function': function,
      'businessname': 'INTRALE',
    };

    debugPrint("INTRALE: initializeHeaders headers:" + this.headers.toString());
    debugPrint('Fin Inicializando Servicio');
    return;
  }

  Service({this.endpoint, this.function}) {}

  Response mapToResponse(Map responseMap);

  Future<Response> post(Object request) async {
    await initializeHeaders();

    String body = jsonEncode(request);

    debugPrint("INTRALE: Invocando:" + endpoint);
    debugPrint("INTRALE: headers:" + this.headers.toString());
    debugPrint("INTRALE: body => \n" + body);

    HTTP.Response response =
        await HTTP.post(endpoint, headers: this.headers, body: body);

    debugPrint(
        "INTRALE: response statusCode => \n" + response.statusCode.toString());
    debugPrint("INTRALE: response body => \n" + response.body);
    Map responseMap = jsonDecode(response.body);

    return mapToResponse(responseMap);
  }
}
