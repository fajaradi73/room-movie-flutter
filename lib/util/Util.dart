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

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:room_movie/util/logger.dart';
import 'package:url_launcher/url_launcher.dart';

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

String prettify(double d) {
  return d.toStringAsFixed(1).replaceFirst(RegExp(r'\.?0*$'), '');
}

String durationToString(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0].padLeft(1, '')}h ${parts[1].padLeft(1, '')}m';
}

Future<void> openFacebook(String url) async {
  String fbProtocolUrl;
  if (Platform.isIOS) {
    fbProtocolUrl = 'fb://profile/$url';
  } else {
    // fbProtocolUrl = 'fb://facewebmodal/f?href=$url';

    fbProtocolUrl = 'fb://page/$url';
  }

  var fallbackUrl = Uri.parse('https://www.facebook.com/$url');

  try {
    Uri fbBundleUri = Uri.parse(fbProtocolUrl);
    if (await canLaunchUrl(fbBundleUri)) {
      print("launch Apps");
      launchUrl(fbBundleUri, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(fallbackUrl)) {
      print("launch Web");
      await launchUrl(fallbackUrl, mode: LaunchMode.platformDefault);
    }
  } catch (e) {
    Logger.e("error lauch", ex: e);
  }
}

launchURL(String url) async {
  final canLaunch = await canLaunchUrl(Uri.parse(url));
  if (kIsWeb) {
    if (canLaunch) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url";
    }
    return;
  }
  if (Platform.isAndroid) {
    if (url.startsWith("https://www.facebook.com/")) {
      final url2 = "fb://facewebmodal/f?href=$url";
      final intent2 = AndroidIntent(action: "action_view", data: url2);
      var canWork = await intent2.canResolveActivity() ?? false;
      if (canWork) return intent2.launch();
    }
    final intent = AndroidIntent(action: "action_view", data: url);
    return intent.launch();
  } else {
    if (canLaunch) {
      await launchUrl(Uri.parse(url));
    } else {
      throw "Could not launch $url";
    }
  }
}

launchInstagram(String id) async {
  var nativeUrl = Uri.parse("http://instagram.com/_u/$id");
  var webUrl = Uri.parse("https://www.instagram.com/$id/");
  try {
    if (await canLaunchUrl(nativeUrl)) {
      await launchUrl(nativeUrl, mode: LaunchMode.externalApplication);
    } else if (await canLaunchUrl(webUrl)) {
      await launchUrl(webUrl, mode: LaunchMode.platformDefault);
    }
  } catch (e) {
    print("can't open Instagram : $e");
  }
}
