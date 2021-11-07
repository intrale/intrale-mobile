import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as HTTP;
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Response.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class Service<RES extends Response> {
  bool initialized = false;

  Map<int, Handler> handlers;
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

  Service({this.endpoint, this.function, List<Handler> handlers}) {
    if (handlers != null) {
      debugPrint('handlers:' + handlers.toString());
      this.handlers = Map.fromIterable(handlers,
          key: (handler) => handler.statusCode, value: (handler) => handler);
    }
  }

  RES mapToResponse(Map responseMap);

  Future<RES> post({Object request}) async {
    await initializeHeaders();

    String body = jsonEncode(request);

    debugPrint("INTRALE: Invocando:" + endpoint);
    debugPrint("INTRALE: headers:" + this.headers.toString());
    debugPrint("INTRALE: body => \n" + body);

    HTTP.Response httpResponse =
        await HTTP.post(endpoint, headers: this.headers, body: body);

    debugPrint("INTRALE: response statusCode => \n" +
        httpResponse.statusCode.toString());
    debugPrint("INTRALE: response body => \n" + httpResponse.body);
    Map responseMap = jsonDecode(httpResponse.body);

    RES response = mapToResponse(responseMap);

    //Tratar resultado con handlers
    if (handlers != null) {
      Handler handler = handlers[response.statusCode];
      if (handler == null) {
        handler = handlers[0];
      }
      handler.execute(response);
    }

    return response;
  }
}
