/*
 * room_movie
 *     splash_bloc.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:room_movie/screen/widget/custom_alert_dialog.dart';

import '../../router/app_route.dart';

class SplashBloc extends FullLifeCycleController with FullLifeCycleMixin {
  var screenLoad = false.obs;
  var isSetting = false;

  @override
  void onReady() {
    (this).permissionServiceCall();
  }

  void loginTest() {
    Get.offNamed(Pages.dashboardScreen);
  }

  Future<void> _splashDuration() async {
    await Future.delayed(const Duration(milliseconds: 500));
    screenLoad(true);
    await Future.delayed(const Duration(seconds: 1));
    screenLoad(false);
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {
    if ((this).isSetting) {
      (this).isSetting = false;
      (this).permissionServiceCall();
    }
  }

  permissionServiceCall() async {
    bool success = false;
    await _splashDuration();
    await permissionServices().then(
      (value) async {
        for (var entry in value.entries) {
          if (await entry.key.isGranted) {
            success = true;
          }
        }
      },
    );
    if (success) {
      (this).loginTest();
    } else {
      Get.dialog(
          CustomAlertDialog(
            title: "Permission Needed",
            description: "Permission dibutuhkan untuk menggunakan aplikasi",
            yesTitle: "Setting",
            noTitle: "Keluar",
            actionYes: () async {
              (this).isSetting = true;
              openAppSettings();
              Get.back();
            },
            actionNo: () async {
              SystemNavigator.pop();
            },
          ),
          barrierDismissible: false);
    }
  }

  /*Permission services*/
  Future<Map<Permission, PermissionStatus>> permissionServices() async {
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      //add more permission to request here.
    ].request();
    bool granted = true;
    for (var entry in statuses.entries) {
      if (await entry.key.isPermanentlyDenied) {
        await openAppSettings().then(
          (value) async {
            if (value) {
              if ((await entry.key.status.isPermanentlyDenied == true &&
                  await entry.key.status.isGranted == false)) {
                // openAppSettings();
                granted =
                    false; /* opens app settings until permission is granted */
              }
            }
          },
        );
      } else {
        if (await entry.key.isDenied) {
          granted = false;
        }
      }
    }
    /*{Permission.camera: PermissionStatus.granted, Permission.storage: PermissionStatus.granted}*/
    return statuses;
  }
}
