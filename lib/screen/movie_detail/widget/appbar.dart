// ignore_for_file: file_names
/*
 * 
 *     widget_appbar
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/screen/widget/image_view.dart';

import '../../../models/movie/Results.dart';
import '../bloc.dart';

class MovieDetailWidgetAppbar extends GetView<MovieDetailBloc> {
  const MovieDetailWidgetAppbar({Key? key, required this.data})
      : super(key: key);
  final Results data;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SliverAppBar(
          expandedHeight: 34.0.height(),
          floating: false,
          title: (controller.isShow.value)
              ? Text("${data.title}",
                  style: const TextStyle(
                    fontSize: 16.0,
                  ))
              : null,
          snap: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: (!controller.isShow.value)
                ? Text("${data.title}",
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
                    child: Container(
                      height: 18.0.height(),
                      width: 35.0.width(),
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(color: Colors.white)),
                        child: Hero(
                          tag: "${data.id}",
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
          ));
    });
  }
}
