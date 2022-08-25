import 'package:flutter/material.dart';
import 'package:room_movie/models/preference/StorageManager.dart';
import 'package:room_movie/screen/SplashScreen.dart';
import 'package:room_movie/util/ThemeManager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    methodAsync();
  }

  void methodAsync() async {
    _themeMode = await StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? ThemeMode.light.name;
      if (themeMode == ThemeMode.light.name) {
        _themeMode = ThemeMode.light;
      } else {
        _themeMode = ThemeMode.dark;
      }
      return _themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeManager().lightTheme,
        darkTheme: ThemeManager().darkTheme,
        themeMode: _themeMode,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }

  void changeTheme(ThemeMode themeMode) async {
    setState(() {
      _themeMode = themeMode;
      StorageManager.saveData('themeMode', themeMode.name);
    });
  }

  isNightMode() {
    if (_themeMode == ThemeMode.light) {
      return false;
    } else {
      return true;
    }
  }
}
