// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 04/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';

import '../../../models/movie/Results.dart';
import '../../widget/image_view.dart';
import '../bloc.dart';

class SerialTvDetailWidgetAppbar extends GetView<SerialTvDetailBloc> {
  const SerialTvDetailWidgetAppbar({Key? key, required this.data})
      : super(key: key);
  final Results data;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SliverAppBar(
        expandedHeight: 34.0.height(),
        floating: false,
        title: (controller.isShow.value)
            ? Text("${data.name}",
                style: const TextStyle(
                  fontSize: 16.0,
                ))
            : null,
        snap: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: (!controller.isShow.value)
              ? Text("${data.name}",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ))
              : null,
          background: Stack(
            children: [
              ImageView(
                url: data.backdropPath,
                fit: BoxFit.cover,
              ),
              Container(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                child: Center(
                  child: Hero(
                    tag: "${data.id}",
                    child: Container(
                      height: 18.0.height(),
                      width: 35.0.width(),
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Colors.white)),
                        child: ImageView(
                          url: data.posterPath,
                          fit: BoxFit.fill,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
