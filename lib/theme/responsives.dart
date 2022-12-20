/*
 * room_movie
 *     responsives.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Responsive {
  static bool isTablet() {
    return MediaQuery.of(Get.context!).size.shortestSide > 600;
  }

  static bool isMobile() {
    return MediaQuery.of(Get.context!).size.shortestSide < 600;
  }
}
