// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ThemeManager{
  get darkTheme => ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
  );

  get lightTheme => ThemeData(
    primarySwatch: Colors.amber,
    primaryColor: const Color(0xffc79700),
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: const IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
  );

}
