/*
 * room_movie
 *     splash_screen.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/gen_theme/colors.gen.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/splash_screen/splash_bloc.dart';
import 'package:room_movie/screen/widget/animated_size_switcher.dart';

import '../../gen_theme/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final logic = Get.find<SplashBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          color: ColorName.colorPrimary,
          child: Obx(() {
            return (logic.screenLoad.value == false)
                ? Center(
                    child: SizedBox(
                      child: Assets.images.background.image(),
                    ),
                  )
                : AnimatedSwitcherSize(
                    child: (logic.screenLoad.value == true)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 5.0.height()),
                              Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.grey.withOpacity(0.3),
                                  strokeWidth: 2.5,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 2.0.height()),
                            ],
                          )
                        : const SizedBox());
          })),
    );
  }
}
