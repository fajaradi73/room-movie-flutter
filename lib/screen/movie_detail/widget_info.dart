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
import 'package:room_movie/screen/movie_detail/bloc.dart';

import '../../gen_theme/assets.gen.dart';
import '../../models/movie/Results.dart';

class MovieDetailWidgetInfo extends GetView<MovieDetailBloc> {
  const MovieDetailWidgetInfo({Key? key, required this.data}) : super(key: key);
  final Results data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: 45,
                  height: 45,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 22.0, vertical: 10.0),
                  child: Center(
                    child: Assets.svg.facebook.svg(),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 45,
                  height: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Center(
                    child: Assets.svg.twitter.svg(),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 45,
                  height: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Center(
                    child: Assets.svg.instagram.svg(),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 45,
                  height: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Center(
                    child: Assets.svg.link.svg(),
                  ),
                ),
              )
            ],
          ),
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
            child: const Text(
              "Tagline",
              style: TextStyle(fontSize: 14),
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
            child: const Text(
              "Indonesia",
              style: TextStyle(fontSize: 14),
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
            child: const Text(
              "120.000",
              style: TextStyle(fontSize: 14),
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
            child: const Text(
              "120.000",
              style: TextStyle(fontSize: 14),
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
          ChipsChoice.single(
            value: "",
            onChanged: (val) {
              print(val);
            },
            wrapped: true,
            choiceItems: C2Choice.listFrom<int, String>(
              source: controller.options,
              value: (i, v) => i,
              label: (i, v) => v,
              tooltip: (i, v) => v,
            ),
            choiceStyle: C2ChipStyle.filled(
              padding: const EdgeInsets.all(2),
              foregroundStyle: const TextStyle(fontSize: 13),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              selectedStyle: C2ChipStyle.filled(),
            ),
          )
        ],
      ),
    );
  }
}
