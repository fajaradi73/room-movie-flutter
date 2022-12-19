// ignore_for_file: file_names

/*
 * room_movie
 *     MovieScreen.dart
 *     Created by Fajar Adi Prasetyo on 24/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:flutter/material.dart';

import '../widget/WidgetListView.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  var mapsMovie = {
    "Popular": [],
    "Sedang Tayang": [],
    "Ratting Teratas": [],
    "Mendatang": [],
    "Sedang Tren": []
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mapsMovie.length,
        itemBuilder: (BuildContext context, int index) {
          var value = mapsMovie.keys.elementAt(index);
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
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
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
              SizedBox(
                height: 260,
                child: WidgetListView(true),
              )
            ],
          );
        });
  }
}
