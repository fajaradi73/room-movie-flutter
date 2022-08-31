/*
 * room_movie
 *     MainScreen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:room_movie/screen/artist/ArtistScreen.dart';
import 'package:room_movie/screen/main/MainView.dart';
import 'package:room_movie/screen/movie/MovieScreen.dart';
import 'package:room_movie/screen/serialTv/SerialTvScreen.dart';
import 'package:room_movie/screen/settings/SettingsScreen.dart';

import '../home/HomeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> implements HomeView {
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
    } else if (index == 3) {
      return const ArtistScreen();
    } else if (index == 2) {
      return const SerialTvScreen();
    } else if (index == 1) {
      return const MovieScreen();
    } else {
      return const HomeScreen();
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
        elevation: 1,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Pengaturan"),
      );
    } else {
      if (index == 3) {
        searchHint = "Search Artist";
      } else if (index == 2) {
        searchHint = "Search Serial Tv";
      } else if (index == 1) {
        searchHint = "Search Movie";
      } else {
        searchHint = "Search Movie, Serial Tv, Artist";
      }
      return appBar();
    }
    setState(() {});
  }

  @override
  appBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Theme.of(context).primaryColor,
      title: SizedBox(
        height: 45,
        child: TextField(
          onTap: () {},
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: searchHint,
              filled: true,
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
