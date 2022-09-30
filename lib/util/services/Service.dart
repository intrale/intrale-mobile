import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as HTTP;
import 'package:intrale/comp/ItlCustom.dart';
import 'package:intrale/util/services/Handler.dart';
import 'package:intrale/util/services/Response.dart';

import 'package:shared_preferences/shared_preferences.dart';

const List<Handler> DEFAULT_HANDLER_LIST = <Handler>[];

abstract class Service<RES extends Response> {
  bool initialized = false;

  Map<int, Handler>? handlers;
  Map<String, String>? headers;

  String endpoint;
  String function;

  Service(
      {required this.endpoint,
      required this.function,
      List<Handler> handlers = DEFAULT_HANDLER_LIST}) {
    if (handlers != null) {
      debugPrint('handlers:' + handlers.toString());
      this.handlers = Map.fromIterable(handlers,
          key: (handler) => handler.statusCode, value: (handler) => handler);
    }
  }

  Future initializeHeaders() async {
    if (initialized) {
      return;
    }
    debugPrint('Inicializando Servicio');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = '';
    String? idToken = '';

    if (sharedPreferences.containsKey('accessToken')) {
      accessToken = sharedPreferences.getString('accessToken');
    }
    if (sharedPreferences.containsKey('idToken')) {
      idToken = sharedPreferences.getString('idToken');
    }

    this.headers = {
      'Content-type': 'application/json',
      'Authorization': accessToken.toString(),
      'idtoken': idToken.toString(),
      'function': function,
      'businessname': ItlCustom.instance.custom.businessname,
    };

    initialized = true;
    debugPrint("INTRALE: initializeHeaders headers:" + this.headers.toString());
    debugPrint('Fin Inicializando Servicio');
    return;
  }

  RES mapToResponse(Map<String, dynamic> responseMap);

  Future<RES> post({required Object request}) async {
    EasyLoading.show();
    await initializeHeaders();

    String body = jsonEncode(request);

    debugPrint("INTRALE: Invocando:" + endpoint);
    debugPrint("INTRALE: headers:" + this.headers.toString());
    debugPrint("INTRALE: body => \n" + body);

    HTTP.Response httpResponse =
        await HTTP.post(Uri.parse(endpoint), headers: this.headers, body: body);

    debugPrint("INTRALE: response statusCode => \n" +
        httpResponse.statusCode.toString());
    debugPrint("INTRALE: response body => \n" + httpResponse.body);
    Map<String, dynamic> responseMap = jsonDecode(httpResponse.body);

    RES response = mapToResponse(responseMap);

    //Tratar resultado con handlers
    if ((handlers != null) && (handlers!.isNotEmpty)) {
      Handler? handler = handlers![response.statusCode];
      if (handler == null) {
        handler = handlers![0];
      }
      handler!.execute(response);
    }

    EasyLoading.dismiss();
    return response;
  }
}
