// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 20/02/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/season/bloc.dart';
import 'package:room_movie/screen/widget/animated_list_builder.dart';
import 'package:room_movie/screen/widget/gesture_scaffold.dart';
import 'package:room_movie/screen/widget/global_header.dart';

import '../widget/image_view.dart';

class SeasonScreen extends GetView<SeasonBloc> {
  const SeasonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureScaffold(
        appBar: GlobalHeader(
          title: controller.title,
        ),
        body: (controller.listSeason.isNotEmpty)
            ? AnimatedListBuilder(
                itemCount: controller.listSeason.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = controller.listSeason[index];
                  return InkWell(
                    onTap: () {},
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.0.height(),
                                width: Get.width * 0.35,
                                child: Card(
                                    semanticContainer: true,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ImageView(
                                      url: item.posterPath,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Container(
                                width: Get.width * 0.59,
                                alignment: Alignment.topLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      width: Get.width * 0.59,
                                      margin: const EdgeInsets.all(3),
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        "${item.name}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.59,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        "${item.airDate?.dateFormat(currentFormat: "yyyy-MM-dd", desiredFormat: "yyyy") ?? "Unknown"} "
                                        " | ${item.episodeCount} Episode",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width * 0.59,
                                      margin: const EdgeInsets.all(8),
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        "${controller.title} ${item.name} ditayangkan pada tanggal ${item.airDate?.dateFormat(currentFormat: "yyyy-MM-dd", desiredFormat: "dd MMMM") ?? "Unknown"}",
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          color: Theme.of(context).dividerColor,
                        ),
                      ],
                    ),
                  );
                })
            : const Center(
                child: Text("No Data"),
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
