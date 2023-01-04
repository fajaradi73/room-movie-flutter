// ignore_for_file: file_names
/*
 * 
 *     setting_bloc
 *     Created by Fajar Adi Prasetyo on 20/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'dart:io';

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:room_movie/util/logger.dart';

import '../../util/util.dart';

class SettingsBloc extends GetxController {
  var sizeCache = "".obs;
  var version = "".obs;

  void openScreen() {
    (this).methodAsync();
    (this).loadCache();
  }

  Future<void> methodAsync() async {
    var packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
  }

  ///Load cache
  Future<void> loadCache() async {
    var sizeCache = 0.0;
    try {
      Directory tempDir = await getTemporaryDirectory();
      double value = await getTotalSizeOfFilesInDir(tempDir);
      sizeCache += value;
      var list = await getExternalCacheDirectories();
      if (list != null) {
        for (int i = 0; i < list.length; i++) {
          var dir = list[i];
          var size = await getTotalSizeOfFilesInDir(dir);
          sizeCache += size;
        }
      }
      (this).sizeCache.value = renderSize(sizeCache);
    } catch (err) {
      Logger.e("Error cache", ex: err);
    }
  }

  Future<void> clearCache() async {
    //Loading is shown here
    try {
      Directory tempDir = await getTemporaryDirectory();
      //Delete cache directory
      await delDir(tempDir);
      (this).loadCache();
      Get.snackbar("Clear cache", "Clear cache successfully");
    } catch (e) {
      Get.snackbar("Clear cache", "Failed to clear cache");
    } finally {
      //Hidden here loading loading
    }
  }
}
