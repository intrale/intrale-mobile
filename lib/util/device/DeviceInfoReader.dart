import 'package:device_info_plus/device_info_plus.dart';
import 'package:intrale/util/device/IntraleDeviceInfo.dart';

abstract class DeviceInfoReader {

  late DeviceInfoPlugin deviceInfoPlugin;

  DeviceInfoReader(DeviceInfoPlugin deviceInfoPlugin){
    this.deviceInfoPlugin = deviceInfoPlugin;
  }

  Future<IntraleDeviceInfo> getDeviceInfo(); 
}