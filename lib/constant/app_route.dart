/*
 * room_movie
 *     app_route.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:get/get.dart';
import 'package:room_movie/screen/main/main_screen.dart';
import 'package:room_movie/screen/main/main_bloc.dart';

import '../screen/splash_screen/splash_screen.dart';


class AppRoute {
  static final List<GetPage> routes = [
    GetPage(
        name: Pages.splashScreen,
        page: () => SplashScreen(),
        binding: BindingsBuilder(() {})),
    GetPage(
        name: Pages.mainScreen,
        page: () => MainScreen(),
        binding: BindingsBuilder(() {
          Get.put(MainBloc());
        })),
  ];
}

class Pages {
  static const splashScreen = "/splash_screen";
  static const mainScreen = "/main_screen";
}
