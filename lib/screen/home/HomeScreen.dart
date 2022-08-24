// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:room_movie/screen/home/HomeView.dart';
import 'package:room_movie/screen/movie/MovieScreen.dart';
import 'package:room_movie/screen/settings/SettingsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeView {
  var searchHint = "Search Movie";

  int _selectedNavbar = 0;

  @override
  void changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  viewNavbar(index) {
    if (index == 4) {
      return const SettingsScreen();
    } else {
      return const MovieScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: changeAppBar(_selectedNavbar),
      body: viewNavbar(_selectedNavbar),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  @override
  changeAppBar(index) {
    if (index == 4) {
      return AppBar(
        title: const Text("Pengaturan"),
      );
    } else {
      return appBar();
    }
  }

  @override
  appBar() {
    return AppBar(
      title: SizedBox(
        height: 45,
        child: TextField(
          onTap: () {},
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: searchHint,
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).primaryIconTheme.color,
              )),
        ),
      ),
    );
  }

  @override
  bottomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_creation_outlined),
          label: 'Film',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tablet),
          label: 'Serial Tv',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Artis',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Pengaturan',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedNavbar,
      showUnselectedLabels: true,
      onTap: changeSelectedNavBar,
    );
  }
}
