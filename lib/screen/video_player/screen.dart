// ignore_for_file: file_names, import_of_legacy_library_into_null_safe
/*
 *     Created by Fajar Adi Prasetyo on 20/02/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/models/movie/detail/videos.dart';
import 'package:room_movie/screen/video_player/bloc.dart';
import 'package:room_movie/screen/widget/gesture_scaffold.dart';

class VideoScreen extends GetView<VideoBloc> {
  const VideoScreen({Key? key, required this.items}) : super(key: key);
  final VideosItem items;

  @override
  Widget build(BuildContext context) {
    return GestureScaffold(
      body: Container(
        color: Colors.black54,
        child: Align(
          alignment: Alignment.center,
          child: Container(),
        ),
      ),
    );
  }
}
