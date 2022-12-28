// ignore_for_file: file_names
/*
 * 
 *     widget_info
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:room_movie/gen_theme/colors.gen.dart';
import 'package:room_movie/models/movie/detail/keyword_item.dart';
import 'package:room_movie/screen/movie_detail/bloc.dart';
import 'package:room_movie/util/Util.dart';

import '../../../models/movie/Results.dart';

class MovieDetailWidgetInfo extends GetView<MovieDetailBloc> {
  MovieDetailWidgetInfo({Key? key, required this.data}) : super(key: key);
  final Results data;
  final formatCurrency = NumberFormat.simpleCurrency(
    decimalDigits: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
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
              "Status",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: Text(
              "${data.status}",
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Bahasa Ucapan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: Text(
              controller.getLanguage(
                  data.originalLanguage, data.spokenLanguages),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Anggaran",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: Text(
              formatCurrency.format(data.budget),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Pemasukan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: Text(
              formatCurrency.format(data.revenue),
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Kata Kunci",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          (data.keywords != null &&
                  data.keywords?.keywords != null &&
                  data.keywords?.keywords?.isNotEmpty == true)
              ? ChipsChoice.single(
                  value: "",
                  onChanged: (val) {},
                  wrapped: true,
                  choiceItems: C2Choice.listFrom<int, KeywordItem>(
                    source: data.keywords?.keywords ?? [],
                    value: (i, v) => v.id ?? 0,
                    label: (i, v) => v.name.toString(),
                  ),
                  choiceStyle: C2ChipStyle.filled(
                    color: ColorName.grey300,
                    padding: const EdgeInsets.all(2),
                    foregroundStyle:
                        const TextStyle(fontSize: 13, color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    selectedStyle: C2ChipStyle.filled(),
                  ),
                )
              : Container(
                  width: Get.width,
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.all(3),
                  child: const Text(
                    "Tidak ditemukan",
                    style: TextStyle(fontSize: 14),
                  ),
                )
        ],
      ),
    );
  }
}
