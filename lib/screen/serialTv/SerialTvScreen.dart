/*
 * room_movie
 *     SerialTvScreen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../widget/WidgetListView.dart';

class SerialTvScreen extends StatefulWidget {
  const SerialTvScreen({Key? key}) : super(key: key);

  @override
  State<SerialTvScreen> createState() => _SerialTvScreenState();
}

class _SerialTvScreenState extends State<SerialTvScreen> {
  var mapsTv = {
    "Sedang Tayang": [],
    "Tayang di Tv": [],
    "Popular": [],
    "Ratting Teratas": []
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mapsTv.length,
        itemBuilder: (BuildContext context, int index) {
          var value = mapsTv.keys.elementAt(index);
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
              const SizedBox(
                height: 260,
                child: WidgetListView(),
              )
            ],
          );
        });
  }
}
