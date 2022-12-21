/*
 * room_movie
 *     serial_tv_screen.dart
 *     Created by Fajar Adi Prasetyo on 25/8/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	: https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/models/enum/tv_type.dart';

import '../../constant/app_route.dart';
import '../dashboard/dashboard_bloc.dart';
import '../widget/LoadingScreen.dart';
import 'serial_tv_bloc.dart';
import 'serial_tv_widget_list.dart';

class SerialTvScreen extends GetView<SerialTvBloc> {
  SerialTvScreen({super.key});

  final dashboardBloc = Get.find<DashboardBloc>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.isLoading.value == true)
        ? const LoadingScreen()
        : ListView.builder(
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
                    height: 270,
                    child: SerialTvWidgetList(controller.mapsTv[key]!),
                  )
                ],
              );
            }));
  }
}
