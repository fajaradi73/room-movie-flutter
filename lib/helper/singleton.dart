import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Global App Singleton
class AppSingleton {
  late SharedPreferences sharedPreferences;
  late AndroidDeviceInfo androidDeviceInfo;
  late IosDeviceInfo iosDeviceInfo;
  late PackageInfo packageDeviceInfo;

  AppSingleton({
    required this.sharedPreferences,
    required this.androidDeviceInfo,
    required this.iosDeviceInfo,
    required this.packageDeviceInfo,
  });

  ///FOR INIT (Make Sure to call await)
  static Future<void> init() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    final deviceInfo = DeviceInfoPlugin();
    var sharedPref = await SharedPreferences.getInstance();
    var packageInfo = await PackageInfo.fromPlatform();
    var androidInfo = await deviceInfo.androidInfo;
    var iosInfo = await deviceInfo.iosInfo;

    Get.put(
      permanent: true,
      AppSingleton(
        sharedPreferences: sharedPref,
        androidDeviceInfo: androidInfo,
        packageDeviceInfo: packageInfo,
        iosDeviceInfo: iosInfo,
      ),
    );
  }

  ///To get initialized [SharedPreferences].
  static SharedPreferences get prefrence {
    return Get.find<AppSingleton>().sharedPreferences;
  }

  ///To get initialized [PackageInfo]
  static PackageInfo get infoPackage {
    return Get.find<AppSingleton>().packageDeviceInfo;
  }

  ///To get initialized [AndroidDeviceInfo]
  static AndroidDeviceInfo get infoAndroid {
    return Get.find<AppSingleton>().androidDeviceInfo;
  }

  ///To get initialized [IosDeviceInfo]
  static IosDeviceInfo get infoIos {
    return Get.find<AppSingleton>().iosDeviceInfo;
  }
}
