/*
 * room_movie
 *     HomeScreen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:room_movie/models/movie/Movie.dart';
import 'package:room_movie/models/movie/Results.dart';
import 'package:room_movie/service/ApiService.dart';
import 'package:room_movie/screen/widget/LoadingScreen.dart';
import 'package:room_movie/screen/widget/WidgetListView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Results> listMovie = [];
  List<Results> listTv = [];

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovie();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? const LoadingScreen()
        : SingleChildScrollView(
            child: Column(
              children: [widgetMovie(), widgetTv(), widgetArtist()],
            ),
          );
  }

  widgetMovie() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text("Popular Movie",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(minHeight: 250, maxHeight: 270),
          child: WidgetListView(listMovie, true),
        )
      ],
    );
  }

  widgetTv() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Popular Serial Tv",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(minHeight: 250, maxHeight: 270),
          child: WidgetListView(listTv, false),
        )
      ],
    );
  }

  widgetArtist() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.zero,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text("Popular Artist",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.all(10),
                    child: const Icon(Icons.keyboard_arrow_right))
              ],
            ),
          ),
        ),
        Container(
          constraints: const BoxConstraints(minHeight: 250, maxHeight: 270),
          child: WidgetListView([], false),
        )
      ],
    );
  }

  getMovie() {
    ApiService.getMoviePopular(1).then((value) {
      Response response = value;
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Movie data = Movie.fromJson(json);
        listMovie = data.results;
      }
      getSerialTv();
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  getSerialTv() {
    ApiService.getTVPopular(1).then((value) {
      Response response = value;
      isLoading = false;
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        Movie data = Movie.fromJson(json);
        listTv = data.results;
      }
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }, onError: (error) {
      if (kDebugMode) {
        print(error);
      }
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }
}
