/*
 * room_movie
 *     screen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/models/enum/tv_type.dart';
import 'package:room_movie/router/app_route.dart';
import 'package:room_movie/screen/dashboard/bloc.dart';
import 'package:room_movie/screen/shimmer/shimmer_results.dart';
import 'package:room_movie/screen/widget/animated_list_builder.dart';
import 'package:room_movie/screen/widget/shimmer_loading.dart';

import 'bloc.dart';
import 'list_item.dart';

class SerialTvScreen extends GetView<SerialTvBloc> {
  SerialTvScreen({super.key});

  final dashboardBloc = Get.find<DashboardBloc>();

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      onRefresh: () async {
        await controller.getToday();
      },
      child: Obx(() => AnimatedListBuilder(
          shrinkWrap: true,
          itemCount: controller.mapsTv.length,
          itemBuilder: (BuildContext context, int index) {
            var key = controller.mapsTv.keys.elementAt(index);
            var list = controller.mapsTv[key]!;
            return Column(
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  child: InkWell(
                    onTap: () {
                      dashboardBloc.tvType.value = key.getType();
                      Get.toNamed(Pages.serialTvListScreen);
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            key,
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
                Container(
                    constraints: BoxConstraints(
                        minHeight: Get.height * 0.3,
                        maxHeight: Get.height * 0.36),
                    child: (list.isNotEmpty)
                        ? AnimatedListBuilder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: list.length > 5 ? 5 : list.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data = list[index];
                              return SerialTvWidgetListItem(data);
                            },
                          )
                        : SwitcherBuilder(
                            fadeDuration: const Duration(milliseconds: 1000),
                            sizeDuration: const Duration(milliseconds: 1000),
                            builder: () {
                              return AnimatedListBuilder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return ShimmerSwitch(
                                    stream: controller.isLoading.stream,
                                    child: const ShimmerResults(),
                                  );
                                },
                              );
                            },
                          )),
              ],
            );
          })),
    );
  }
}
