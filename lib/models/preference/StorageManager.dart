// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static void saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is int) {
      prefs.setInt(key, value);
    } else if (value is String) {
      prefs.setString(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else {
      if (kDebugMode) {
        print("Invalid Type");
      }
    }
  }

  static Future<dynamic> readData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  static Future<bool> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  static Brightness getTheme() {
    Brightness brightness = Brightness.light;
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? Brightness.light.name;
      if (themeMode == Brightness.light.name) {
        brightness = Brightness.light;
      } else {
        brightness = Brightness.dark;
      }
      return brightness;
    });
    return brightness;
  }
}
