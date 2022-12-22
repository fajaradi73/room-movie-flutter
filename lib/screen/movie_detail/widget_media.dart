// ignore_for_file: file_names
/*
 * 
 *     widget_media
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/gen_theme/colors.gen.dart';
import 'package:room_movie/helper/extensions.dart';

class MovieDetailWidgetMedia extends StatelessWidget {
  const MovieDetailWidgetMedia({Key? key}) : super(key: key);

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
              "Media",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                child: const Text(
                  "Video",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                child: const Text(
                  "(20)",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                child: const Text(
                  "Lihat Semua Video",
                  style: TextStyle(fontSize: 16, color: ColorName.blue500),
                ),
              ),
            ],
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: 200, maxHeight: 27.0.height()),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 25.0.height(),
                            width: 65.0.width(),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://images4.alphacoders.com/113/1130246.jpg",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                child: const Text(
                  "Gambar Latar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                child: const Text(
                  "(20)",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                child: const Text(
                  "Lihat Semua Gambar Latar",
                  style: TextStyle(fontSize: 16, color: ColorName.blue500),
                ),
              ),
            ],
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: 200, maxHeight: 27.0.height()),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 25.0.height(),
                            width: 65.0.width(),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://images4.alphacoders.com/113/1130246.jpg",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(3),
                padding: const EdgeInsets.all(3),
                child: const Text(
                  "Poster",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                child: const Text(
                  "(20)",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.all(2),
                padding: const EdgeInsets.all(2),
                child: const Text(
                  "Lihat Semua Poster",
                  style: TextStyle(fontSize: 16, color: ColorName.blue500),
                ),
              ),
            ],
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: 200, maxHeight: 27.0.height()),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(3),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 25.0.height(),
                            width: 65.0.width(),
                            child: Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://images4.alphacoders.com/113/1130246.jpg",
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ]));
  }
}
