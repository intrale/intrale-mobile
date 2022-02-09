import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:intrale/comp/ItlCustomEntity.dart';

class ItlCustom {
  late ItlCustomEntity custom;

  Future initialize() async {
    print("obteniendo custom.json");
    var jsonText =
        await rootBundle.loadString("assets/custom/INTRALE/custom.json");
    print(jsonText);
    Map<String, dynamic> responseMap = jsonDecode(jsonText);
    this.custom = ItlCustomEntity.fromJson(responseMap);
  }

  ItlCustom._privateConstructor() {
    print("Constructor privado ItlCustom");
  }

  static final ItlCustom _instance = ItlCustom._privateConstructor();

  static ItlCustom get instance => _instance;
}
