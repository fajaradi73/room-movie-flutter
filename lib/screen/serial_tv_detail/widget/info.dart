// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 05/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:room_movie/screen/serial_tv_detail/bloc.dart';
import 'package:room_movie/screen/widget/animated_grid_builder.dart';

import '../../../gen_theme/colors.gen.dart';
import '../../../models/movie/Results.dart';
import '../../../models/movie/detail/keyword_item.dart';
import '../../../util/constant.dart';
import '../../../util/util.dart';

class SerialTvDetailWidgetInfo extends GetView<SerialTvDetailBloc> {
  SerialTvDetailWidgetInfo({Key? key, required this.data}) : super(key: key);
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
          mainAxisSize: MainAxisSize.min,
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
                "Umum",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "Nama Asli",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(3),
              child: Text(
                "${data.originalName}",
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "Status",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(3),
              child: Text(
                "${data.status}",
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "Bahasa Ucapan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(3),
              child: Text(
                controller.getLanguage(
                    data.originalLanguage, data.spokenLanguages),
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "Network",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: AnimatedGridBuilder(
                itemCount: data.networks?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  var item = data.networks![index];
                  return InkWell(
                      onTap: () async {},
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8),
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: "${Constant.baseImage}${item.logoPath}",
                              height: 75,
                              width: 75,
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "Jenis",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(3),
              child: Text(
                "${data.type}",
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.all(6),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "Kata Kunci",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            (data.keywords != null &&
                    data.keywords?.results != null &&
                    data.keywords?.results?.isNotEmpty == true)
                ? Container(
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(3),
                    child: ChipsChoice.single(
                      value: "",
                      onChanged: (val) {},
                      wrapped: true,
                      choiceItems: C2Choice.listFrom<int, KeywordItem>(
                        source: data.keywords?.results ?? [],
                        value: (i, v) => v.id ?? 0,
                        label: (i, v) => v.name.toString(),
                      ),
                      choiceStyle: C2ChipStyle.filled(
                        color: ColorName.grey600,
                        padding: const EdgeInsets.all(2),
                        foregroundStyle:
                            const TextStyle(fontSize: 13, color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        selectedStyle: C2ChipStyle.filled(),
                      ),
                    ))
                : Container(
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.all(3),
                    child: const Text(
                      "Tidak ditemukan",
                      style: TextStyle(fontSize: 14),
                    ),
                  )
          ],
        ));
  }
}
