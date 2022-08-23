import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_movie/main.dart';
import 'package:room_movie/util/ThemeManager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                MyApp.of(context).changeTheme(ThemeMode.light);
              },
              child: Text("Light")),
          ElevatedButton(
              onPressed: () {
                MyApp.of(context).changeTheme(ThemeMode.dark);
              },
              child: Text("Dark")),
        ],
      ),
    );
  }
}
