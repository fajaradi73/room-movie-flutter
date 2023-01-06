// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 06/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/screen/search/bloc.dart';
import 'package:room_movie/screen/widget/gesture_scaffold.dart';

class SearchScreen extends GetView<SearchBloc> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureScaffold(
      appBar: searchBar(context),
      body: Container(),
    );
  }

  searchBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      titleSpacing: 0,
      title: Container(
        height: kToolbarHeight,
        alignment: Alignment.center,
        child: TextField(
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.search,
          style: const TextStyle(fontSize: 20),
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              // contentPadding: EdgeInsets.zero,
              hintText: "",
              hintStyle: const TextStyle(fontSize: 20),
              prefixIcon: IconButton(
                onPressed: () {
                  // if (context.hasFocus) {
                  //   context.unFocus();
                  // } else {
                  Get.back();
                  // }
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(Get.context!).primaryIconTheme.color,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.clear,
                  color: Theme.of(Get.context!).primaryIconTheme.color,
                ),
              )),
        ),
      ),
    );
  }
}
