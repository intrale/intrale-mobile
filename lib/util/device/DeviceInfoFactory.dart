import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:intrale/util/device/DeviceInfoReader.dart';
import 'package:intrale/util/device/DeviceInfoReaderAndroid.dart';
import 'package:intrale/util/device/IntraleDeviceInfo.dart';

class DeviceInfoFactory {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  static String operatingSystem = Platform.operatingSystem;

  static Map infoByPlatform = {
    "android": DeviceInfoReaderAndroid(deviceInfoPlugin)
  };

  static final DeviceInfoFactory _singleton = DeviceInfoFactory._();

  DeviceInfoFactory._();

  factory DeviceInfoFactory() {
    print("Constructor DeviceInfoFactory");
    return _singleton;
  }

  DeviceInfoReader getReader(){
    print("DeviceInfoReader getReader()");
    return infoByPlatform[operatingSystem];
  }

  Future<IntraleDeviceInfo> getDeviceInfo(){
    print("Future<IntraleDeviceInfo> getDeviceInfo()");
    return getReader().getDeviceInfo();
  }

}