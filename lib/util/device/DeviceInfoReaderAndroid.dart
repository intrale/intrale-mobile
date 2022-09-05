import 'package:device_info_plus/device_info_plus.dart';
import 'package:intrale/util/device/DeviceInfoReader.dart';
import 'package:intrale/util/device/IntraleDeviceInfo.dart';

class DeviceInfoReaderAndroid extends DeviceInfoReader {

  DeviceInfoReaderAndroid(DeviceInfoPlugin deviceInfoPlugin) : super(deviceInfoPlugin);

  @override
  Future<IntraleDeviceInfo> getDeviceInfo() {
    print("Future<IntraleDeviceInfo> getDeviceInfo()");
    IntraleDeviceInfo deviceInfo = IntraleDeviceInfo();

    return deviceInfoPlugin.androidInfo
        .then((androidDeviceInfo) { 
          deviceInfo.id = androidDeviceInfo.id;
          return deviceInfo;
        });

  }
 
}