/*
 * room_movie
 *     bottom_navigation_list.dart
 *     Created by Fajar Adi Prasetyo on 15/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:flutter/material.dart';

class BottomNavigationList {
  Widget? icon;
  String? label;

  int? index;

  BottomNavigationList({this.icon, this.label, this.index = 0});

  static final items = [
    BottomNavigationList(
        icon: const Icon(Icons.home), label: "Beranda", index: 0),
    BottomNavigationList(
        icon: const Icon(Icons.movie_creation_outlined),
        label: "Film",
        index: 1),
    BottomNavigationList(
        icon: const Icon(Icons.tablet), label: "Serial Tv", index: 2),
    BottomNavigationList(
        icon: const Icon(Icons.people), label: "Artis", index: 3),
    BottomNavigationList(
        icon: const Icon(Icons.settings), label: "Pengaturan", index: 4),
  ];
}
