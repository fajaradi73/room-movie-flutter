/*
 * room_movie
 *     serial_tv_screen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/enum/tv_type.dart';
import 'package:room_movie/screen/widget/shimmer_loading.dart';

import '../../router/app_route.dart';
import '../dashboard/dashboard_bloc.dart';
import '../widget/animated_list_builder.dart';
import 'serial_tv_bloc.dart';
import 'serial_tv_widget_list.dart';

class SerialTvScreen extends GetView<SerialTvBloc> {
  SerialTvScreen({super.key});

  final dashboardBloc = Get.find<DashboardBloc>();

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      onRefresh: () async {
        controller.openScreen();
      },
      child: Obx(() => AnimatedListBuilder(
          shrinkWrap: true,
          itemCount: controller.mapsTv.length,
          itemBuilder: (BuildContext context, int index) {
            var key = controller.mapsTv.keys.elementAt(index);
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
                SizedBox(
                  height: 33.0.height(),
                  child: ShimmerSwitch(
                      stream: controller.isLoading.stream,
                      child: SerialTvWidgetList(controller.mapsTv[key]!)),
                )
              ],
            );
          })),
    );
  }
}
