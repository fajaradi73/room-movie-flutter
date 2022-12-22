// ignore_for_file: file_names
/*
 * 
 *     widget_recomendation
 *     Created by Fajar Adi Prasetyo on 22/12/2022
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2022 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';

class MovieDetailWidgetRecommendation extends StatelessWidget {
  const MovieDetailWidgetRecommendation({Key? key}) : super(key: key);

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
              "Disarankan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            constraints:
                BoxConstraints(minHeight: 200, maxHeight: 31.0.height()),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 75.0.width(),
                      margin: const EdgeInsets.all(3),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                            height: 25.0.height(),
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
                          Container(
                              width: Get.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: Row(
                                children: const [
                                  Text(
                                    "Ganyu",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    "100 %",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  );
                }),
          )
        ]));
  }
}
