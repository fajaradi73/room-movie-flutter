// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ThemeManager {
  get darkTheme => ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: const Color(0xFF212121),
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF313131),
      accentColor: Colors.white,
      accentIconTheme: const IconThemeData(color: Colors.black),
      dividerColor: Colors.black12,
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
              borderSide: BorderSide(color: Colors.grey, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.5))));

  get lightTheme => ThemeData(
      primarySwatch: Colors.amber,
      primaryColor: const Color(0xffc79700),
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      accentColor: Colors.black,
      accentIconTheme: const IconThemeData(color: Colors.white),
      dividerColor: Colors.white54,
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
              borderSide: BorderSide(color: Colors.grey, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.5))));
}
