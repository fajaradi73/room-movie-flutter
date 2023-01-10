// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 10/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/artist_detail/widget/appbar.dart';
import 'package:room_movie/screen/artist_detail/widget/casting.dart';
import 'package:room_movie/screen/artist_detail/widget/info.dart';
import 'package:room_movie/screen/artist_detail/widget/overview.dart';
import 'package:room_movie/screen/artist_detail/widget/peran.dart';

import '../widget/LoadingScreen.dart';
import 'bloc.dart';

class ArtistDetailScreen extends GetView<ArtistDetailBloc> {
  const ArtistDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      var data = controller.data.value;
      return (controller.isLoading.value == true)
          ? const Center(
              child: LoadingScreen(),
            )
          : NestedScrollView(
              controller: controller.scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  ArtistDetailWidgetAppbar(
                    data: data,
                  ),
                ];
              },
              body: Container(
                color: Theme.of(context).primaryColor,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ArtistDetailWidgetOverview(
                        data: data,
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      ArtistDetailWidgetInfo(data: data),
                      const Padding(padding: EdgeInsets.all(2)),
                      ArtistDetailWidgetPeran(
                        list: controller.listPeran(
                            (data.knownForDepartment == "Acting")
                                ? data.combineCredits?.cast
                                : controller.getKnownFor(
                                    data: data.combineCredits?.crew,
                                    department: data.knownForDepartment)),
                      ),
                      const Padding(padding: EdgeInsets.all(2)),
                      ArtistDetailWidgetCasting(
                        department: data.knownForDepartment,
                        data: controller.listCasting(
                            (data.knownForDepartment == "Acting")
                                ? data.combineCredits?.cast
                                : data.combineCredits?.crew),
                      )
                    ],
                  ),
                ),
              ),
            );
    }));
  }
}
