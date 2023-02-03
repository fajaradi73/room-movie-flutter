// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 03/02/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/router/app_route.dart';
import 'package:room_movie/screen/credits/bloc.dart';
import 'package:room_movie/screen/widget/animated_stagger_builder.dart';
import 'package:room_movie/screen/widget/global_header.dart';
import 'package:room_movie/screen/widget/image_view.dart';

import '../widget/gesture_scaffold.dart';

class CreditsScreen extends GetView<CreditsBloc> {
  const CreditsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureScaffold(
        appBar: GlobalHeader(
          height: kToolbarHeight * 2,
          title: controller.title,
          bottomWidget: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              controller: controller.tabController,
              tabs: controller.myTabs),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: controller.myTabs.map((Tab tab) {
            final String label = tab.text!.toLowerCase();
            var list = [];
            if (label.contains("aktor")) {
              list = controller.data.cast ?? [];
            } else if (label.contains("kru")) {
              list = controller.data.crew ?? [];
            }
            return Container(
              constraints:
                  BoxConstraints(minHeight: 200, maxHeight: 30.0.height()),
              child: (list.isNotEmpty == true)
                  ? AnimatedStaggerBuilder(
                      shrinkWrap: true,
                      controller: controller.scrollController,
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      physics: const BouncingScrollPhysics(),
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = list[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Pages.artistDetailScreen,
                                arguments: {"idResults": item?.id});
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: 25.0.height(),
                                  width: 75.0.width(),
                                  child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: ImageView(
                                      url: item?.profilePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  margin: const EdgeInsets.all(2),
                                  padding: const EdgeInsets.all(2),
                                  child: Text("${item?.name}",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 2),
                                ),
                                Container(
                                  width: Get.width,
                                  margin: const EdgeInsets.all(2),
                                  padding: const EdgeInsets.all(2),
                                  child: Text("${item?.character ?? item?.job}",
                                      style: const TextStyle(
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) {
                        return const StaggeredTile.fit(1);
                      },
                    )
                  : const Center(
                      child: Text("No Data"),
                    ),
            );
          }).toList(),
        ),
        floatingActionButton: Obx(() {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            //show/hide animation
            opacity: controller.showButton.value ? 1.0 : 0.0,
            //set obacity to 1 on visible, or hide
            child: FloatingActionButton(
              onPressed: () {
                controller.scrollController.animateTo(
                    //go to top of scroll
                    0, //scroll offset to go
                    duration: const Duration(milliseconds: 500),
                    //duration of scroll
                    curve: Curves.fastOutSlowIn //scroll type
                    );
              },
              child: const Icon(Icons.arrow_upward),
            ),
          );
        }));
  }
}
