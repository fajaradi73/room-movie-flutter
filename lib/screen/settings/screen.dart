// ignore_for_file: file_names, must_be_immutable

/*
 * room_movie
 *     screen.dart
 *     Created by Fajar Adi Prasetyo on 24/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/settings/bloc.dart';
import 'package:room_movie/screen/web/screen.dart';
import 'package:room_movie/screen/widget/custom_alert_dialog.dart';
import 'package:room_movie/theme/theme_cubit.dart';

class SettingsScreen extends GetView<SettingsBloc> {
  SettingsScreen({super.key});

  var isNightMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(builder: (context, theme) {
      isNightMode = context.read<ThemeCubit>().isNightMode();

      return SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            themeWidget(context, theme),
            cacheWidget(),
            InkWell(
              onTap: () {
                moveToWeb("Syarat dan Ketentuan");
              },
              child: Container(
                  height: 30,
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: const Text("Syarat dan Ketentuan")),
            ),
            InkWell(
              onTap: () {
                moveToWeb("Kebijakan dan Privasi");
              },
              child: Container(
                  height: 30,
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: const Text("Kebijakan dan Privasi")),
            ),
            InkWell(
              onTap: () {
                moveToWeb("Kontribusi");
              },
              child: Container(
                  height: 30,
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: const Text("Kontribusi")),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 150,
              child: const Image(
                image: AssetImage("assets/icons/ic_tmdb.png"),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(10),
              child: Text("Version ${controller.version}"),
            )
          ],
        ),
      );
    });
  }

  themeWidget(context, theme) {
    return Container(
      height: 30,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Text("Mode Malam"),
          const Spacer(),
          Switch(
              value: theme.brightness == Brightness.dark ? true : false,
              onChanged: (value) {
                BlocProvider.of<ThemeCubit>(context).toggleTheme();
              })
        ],
      ),
    );
  }

  cacheWidget() {
    return InkWell(
      onTap: () {
        openDialog();
      },
      child: Container(
        height: 30,
        margin: const EdgeInsets.all(10),
        child: Row(
          children: [
            const Text("Bersihkan cache"),
            const Spacer(),
            Obx(() {
              return Text("${controller.sizeCache}");
            })
          ],
        ),
      ),
    );
  }

  openDialog() {
    Get.dialog(CustomAlertDialog(
      title: "Hapus cache",
      description: "Apakah anda ingin menghapus cache?",
      yesTitle: "Iya",
      noTitle: "Tidak",
      actionYes: () {
        controller.clearCache();
        Get.back();
      },
      actionNo: () {
        Get.back();
      },
    ));
  }

  moveToWeb(title) {
    Get.to(WebViewScreen(title, isNightMode));
  }
}
