// ignore_for_file: file_names
/*
 * 
 *     widget_appbar
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';

import '../../models/movie/Results.dart';
import 'bloc.dart';

class MovieDetailWidgetAppbar extends GetView<MovieDetailBloc> {
  const MovieDetailWidgetAppbar({Key? key, required this.data})
      : super(key: key);
  final Results data;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 32.0.height(),
      floating: false,
      title: (controller.isShow.value)
          ? const Text("Collapsing Toolbar",
              style: TextStyle(
                fontSize: 16.0,
              ))
          : null,
      snap: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: (!controller.isShow.value)
              ? const Text("Collapsing Toolbar",
                  style: TextStyle(
                    fontSize: 16.0,
                  ))
              : null,
          background: CachedNetworkImage(
            imageUrl:
                "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              child: Container(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                child: Center(
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://images4.alphacoders.com/113/1130246.jpg",
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                          height: 16.0.height(),
                          width: 35.0.width(),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ))),
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )),
    );
  }
}
