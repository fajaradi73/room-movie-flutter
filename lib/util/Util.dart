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
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:room_movie/util/logger.dart';

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

///Format file size
renderSize(double value) {
  List<String> unitArr = [' B', ' KB', ' MB', ' GB'];
  int index = 0;
  while (value > 1024) {
    index++;
    value = value / 1024;
  }
  String size = value.toStringAsFixed(2);
  return size + unitArr[index];
}

/// Recursively calculate the size of the file
Future<double> getTotalSizeOfFilesInDir(final FileSystemEntity file) async {
  try {
    if (file is File) {
      int length = await file.length();
      return double.parse(length.toString());
    }
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      double total = 0;
      for (final FileSystemEntity child in children) {
        total += await getTotalSizeOfFilesInDir(child);
      }
      return total;
    }
    return 0;
  } catch (e) {
    return 0;
  }
}

///Recursively delete directories
Future<void> delDir(FileSystemEntity file) async {
  try {
    if (file is Directory) {
      final List<FileSystemEntity> children = file.listSync();
      for (final FileSystemEntity child in children) {
        await delDir(child);
      }
    }
    await file.delete();
  } catch (e) {
    Logger.e(e.toString());
  }
}
