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
import 'package:package_info_plus/package_info_plus.dart';
import 'package:room_movie/screen/web/WebViewScreen.dart';

import '../../main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var isSwitch = false;

  var sizeCache = 0;
  var version = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSwitch = MyApp.of(context).isNightMode();
    methodAsync();
  }

  methodAsync() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          themeWidget(),
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
  }

  onChangeSelected(value) {
    if (value) {
      MyApp.of(context).changeTheme(ThemeMode.dark);
    } else {
      MyApp.of(context).changeTheme(ThemeMode.light);
    }
    setState(() {
      isSwitch = value;
    });
  }

  themeWidget() {
    return Container(
      height: 30,
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Text("Mode Malam"),
          const Spacer(),
          Switch(
              value: isSwitch,
              onChanged: (value) {
                onChangeSelected(value);
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
        context, MaterialPageRoute(builder: (context) => WebViewScreen(title,isSwitch)));
  }
}
