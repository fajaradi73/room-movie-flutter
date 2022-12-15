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

import '../models/preference/StorageManager.dart';

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit()
      : super(themeData){
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
      primarySwatch: Colors.amber,
      primaryColor: const Color(0xffffbe00),
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
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.selected) ? Colors.amber : null),
          trackColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.selected) ? Colors.amber : null)),
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
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey),
    switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.selected) ? Colors.amber : null),
        trackColor: MaterialStateProperty.resolveWith((states) =>
            states.contains(MaterialState.selected) ? Colors.amber : null)),
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

  isNightMode(){
    return state.brightness == Brightness.dark ? true : false;
  }
}
