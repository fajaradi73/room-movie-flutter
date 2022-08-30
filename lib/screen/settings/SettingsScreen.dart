// ignore_for_file: file_names

/*
 * room_movie
 *     SettingsScreen.dart
 *     Created by Fajar Adi Prasetyo on 24/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:room_movie/screen/web/WebViewScreen.dart';
import 'package:room_movie/util/ThemeCubit.dart';

import '../../main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var isNightMode = false;

  var sizeCache = 0;
  var version = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // isSwitch = MyApp.of(context).isNightMode();
    methodAsync();
  }

  methodAsync() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    setState(() {});
  }

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
              child: Text("Version $version"),
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
    return Container(
      height: 30,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: const [Text("Bersihkan cache"), Spacer(), Text("35 Mb")],
      ),
    );
  }

  moveToWeb(title) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WebViewScreen(title, isNightMode)));
  }
}
