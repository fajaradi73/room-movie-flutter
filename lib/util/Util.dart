/*
 * room_movie
 *     Util.dart
 *     Created by Fajar Adi Prasetyo on 31/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../models/genre/Genre.dart';
import '../models/movie/Results.dart';

Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
  return rootBundle
      .loadString(assetsPath)
      .then((jsonStr) => jsonDecode(jsonStr));
}

Future<List<dynamic>> parseListJsonFromAssets(String assetsPath) async {
  return rootBundle
      .loadString(assetsPath)
      .then((jsonStr) => jsonDecode(jsonStr));
}

_getGenreName(int id, bool isMovie) async {
  var genre = "";
  List<Genre> listGenre = [];
  var parse = await parseListJsonFromAssets("assets/json/genre_tv.json");
  if (isMovie) {
    parse = await parseListJsonFromAssets("assets/json/genre_movie.json");
  }
  listGenre = List<Genre>.from(parse.map((e) => Genre.fromJson(e)));
  for (var data in listGenre) {
    if (data.id == id) {
      genre = data.name ?? "";
    }
  }
  return genre;
}

Future<String> getGenre(List<int>? listId, bool isMovie) async {
  String nameGenre = "";
  if (listId != null) {
    for (int i = 0; i < listId.length; i++) {
      String name = await _getGenreName(listId[i], isMovie);
      if (name.isNotEmpty) {
        if (i == (listId.length - 1)) {
          nameGenre = nameGenre + name;
        } else {
          nameGenre = "$nameGenre$name • ";
        }
      }
    }
  }
  return nameGenre;
}

Future<String> getKnowFor(List<Results>? list) async {
  String knowFor = "";
  if (list != null) {
    for (int i = 0; i < list.length; i++) {
      if (i == list.length - 1) {
        knowFor += list[i].title == null || list[i].title?.isEmpty == true
            ? "${list[i].name}"
            : "${list[i].title}";
      } else {
        knowFor += list[i].title == null || list[i].title?.isEmpty == true
            ? ("${list[i].name}, ")
            : "${list[i].title}, ";
      }
    }
  }
  return knowFor;
}
