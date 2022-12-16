/*
 * room_movie
 *     ThemeCubit.dart
 *     Created by Fajar Adi Prasetyo on 29/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:room_movie/gen_theme/colors.gen.dart';

import '../models/preference/StorageManager.dart';

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(themeData) {
    getTheme();
  }

  static ThemeData themeData = _lightTheme;

  void getTheme() async {
    themeData = await StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? Brightness.light.name;
      if (themeMode == Brightness.light.name) {
        themeData = _lightTheme;
      } else {
        themeData = _darkTheme;
      }
      return themeData;
    });
    emit(themeData);
  }

  static final _lightTheme = ThemeData(
      primarySwatch: MaterialColor(
          ColorName.colorPrimary.value, getSwatch(ColorName.colorPrimary)),
      primaryColor: ColorName.colorPrimary,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      accentColor: Colors.black,
      accentIconTheme: const IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.grey,
        selectionColor: Colors.grey,
        selectionHandleColor: Colors.grey,
      ),
      primaryIconTheme: const IconThemeData(color: Colors.grey),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: ColorName.colorPrimary,
          unselectedItemColor: Colors.grey),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? ColorName.colorPrimary
                  : null),
          trackColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? ColorName.colorPrimary
                  : null)),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1))),
      cardTheme: const CardTheme(color: Colors.white70, elevation: 1));

  static final _darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: const Color(0xFF212121),
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF313131),
    accentColor: Colors.white,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
      selectionColor: Colors.grey,
      selectionHandleColor: Colors.grey,
    ),
    primaryIconTheme: const IconThemeData(color: Colors.grey),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF212121),
        selectedItemColor: ColorName.colorPrimary,
        unselectedItemColor: Colors.grey),
    switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? ColorName.colorPrimary
                : null),
        trackColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? ColorName.colorPrimary
                : null)),
    inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1))),
    cardTheme: const CardTheme(color: Color(0xff696969), elevation: 1),
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
    StorageManager.saveData('themeMode', state.brightness.name);
  }

  isNightMode() {
    return state.brightness == Brightness.dark ? true : false;
  }
}

Map<int, Color> getSwatch(Color color) {
  final hslColor = HSLColor.fromColor(color);
  final lightness = hslColor.lightness;

  /// if [500] is the default color, there are at LEAST five
  /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
  /// divisor of 5 would mean [50] is a lightness of 1.0 or
  /// a color of #ffffff. A value of six would be near white
  /// but not quite.
  const lowDivisor = 6;

  /// if [500] is the default color, there are at LEAST four
  /// steps above [500]. A divisor of 4 would mean [900] is
  /// a lightness of 0.0 or color of #000000
  const highDivisor = 5;

  final lowStep = (1.0 - lightness) / lowDivisor;
  final highStep = lightness / highDivisor;

  return {
    50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
    100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
    200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
    300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
    400: (hslColor.withLightness(lightness + lowStep)).toColor(),
    500: (hslColor.withLightness(lightness)).toColor(),
    600: (hslColor.withLightness(lightness - highStep)).toColor(),
    700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
    800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
    900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
  };
}
