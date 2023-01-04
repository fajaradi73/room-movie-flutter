/*
 * room_movie
 *     binding.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:get/get.dart';

import '../screen/screen_manager/bloc.dart';
import '../screen/splash_screen/bloc.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashBloc(), fenix: true);
    Get.lazyPut(() => AppManager(), fenix: true);
  }
}
