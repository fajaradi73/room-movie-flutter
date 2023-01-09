// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 09/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';

class ShimmerResults extends StatelessWidget {
  const ShimmerResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20.0.height(),
            width: 75.0.width(),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10.0.height(),
                  width: 21.0.width(),
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: Get.width * 0.5,
                    height: 10.8.height(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: Get.width * 0.5,
                          height: 25,
                          child: const Card(
                            margin: EdgeInsets.all(3),
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.5,
                          height: 25,
                          child: const Card(
                            margin: EdgeInsets.all(3),
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.5,
                          height: 25,
                          child: const Card(
                            margin: EdgeInsets.all(3),
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
