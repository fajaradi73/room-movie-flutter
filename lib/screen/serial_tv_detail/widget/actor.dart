// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 05/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/gen_theme/colors.gen.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/movie/detail/credits.dart';
import 'package:room_movie/screen/movie_detail/bloc.dart';
import 'package:room_movie/screen/widget/animated_list_builder.dart';
import 'package:room_movie/screen/widget/image_view.dart';

class SerialTvDetailWidgetActor extends GetView<MovieDetailBloc> {
  const SerialTvDetailWidgetActor({Key? key, required this.data})
      : super(key: key);
  final Credits? data;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
            width: Get.width,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            child: const Text(
              "Aktor Series",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: 200, maxHeight: 30.0.height()),
            child: (data?.cast != null && data?.cast?.isNotEmpty == true)
                ? AnimatedListBuilder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data?.cast?.length.isGreaterThan(10) == true
                        ? 10
                        : data?.cast?.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = data?.cast![index];
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          width: 45.0.width(),
                          margin: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: 21.0.height(),
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
                                    maxLines: 1),
                              ),
                              Container(
                                width: Get.width,
                                margin: const EdgeInsets.all(2),
                                padding: const EdgeInsets.all(2),
                                child: Text("${item?.character}",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        overflow: TextOverflow.ellipsis),
                                    maxLines: 1),
                              )
                            ],
                          ),
                        ),
                      );
                    })
                : const Center(),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: Get.width,
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              child: const Text(
                "Kru & Aktor Lainnya",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorName.blue500),
              ),
            ),
          ),
        ]));
  }
}
