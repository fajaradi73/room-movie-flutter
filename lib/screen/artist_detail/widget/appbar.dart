// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 10/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';
import 'package:room_movie/models/artist/artist_results.dart';
import 'package:room_movie/screen/artist_detail/bloc.dart';

import '../../../gen_theme/assets.gen.dart';
import '../../widget/image_view.dart';

class ArtistDetailWidgetAppbar extends GetView<ArtistDetailBloc> {
  const ArtistDetailWidgetAppbar({super.key, required this.data});
  final ArtistResults data;

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
              fit: StackFit.expand,
              children: [
                Container(child: Assets.images.film.image(fit: BoxFit.cover)),
                Container(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  child: Center(
                    child: Hero(
                      tag: "${data.id}",
                      child: SizedBox(
                        height: 19.0.height(),
                        width: 35.0.width(),
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: const BorderSide(color: Colors.white)),
                          child: ImageView(
                            url: data.profilePath,
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
