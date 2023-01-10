// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 10/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/artist/artist_results.dart';
import 'package:room_movie/screen/artist_detail/bloc.dart';

import '../../../util/util.dart';

class ArtistDetailWidgetInfo extends GetView<ArtistDetailBloc> {
  const ArtistDetailWidgetInfo({Key? key, required this.data})
      : super(key: key);
  final ArtistResults data;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            ...controller.mapsExternalIds.entries.map((d) {
              var value = d.value;
              return Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () async {
                    await launchURL(value["id"]);
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: Center(
                      child: value['icon'],
                    ),
                  ),
                ),
              );
            }).toList(),
          ]),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Tentang",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Peran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(3),
            child: Text(
              "${data.knownForDepartment}",
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Jumlah Peran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(3),
            child: Text(
              "${controller.getKnownCredits(data.combineCredits?.cast) + controller.getKnownCredits(data.combineCredits?.crew)}",
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Jenis Kelamin",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(3),
            child: Text(
              controller.getGender(data.gender),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Tanggal Lahir",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(3),
            child: Text(
              "${data.birthday.dateFormat(currentFormat: "yyyy-MM-dd", desiredFormat: "dd MMMM yyyy")} ( ${data.birthday.calculateAge(format: "yyyy-MM-dd")} )",
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Kelahiran",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(3),
            child: Text(
              "${data.placeOfBirth}",
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Juga Dikenal Sebagai",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(3),
            child: Text(
              controller.getKnownAs(data.alsoKnownAs),
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ]));
  }
}
