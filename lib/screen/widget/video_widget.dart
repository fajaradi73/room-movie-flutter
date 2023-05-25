// ignore_for_file: file_names, import_of_legacy_library_into_null_safe
/*
 *     Created by Fajar Adi Prasetyo on 20/02/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;

  const VideoWidget({
    required this.videoPlayerController,
    this.looping = false,
    this.autoplay = false,
    Key? key,
  }) : super(key: key);

  @override
  State createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late ChewieController chewieController;
  final double _aspectRatio = 16 / 9;

  @override
  void initState() {
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: _aspectRatio,
      allowFullScreen: true,
      autoInitialize: true,
      showOptions: false,
      autoPlay: widget.autoplay,
      looping: widget.looping,
      allowedScreenSleep: false,
      deviceOrientationsAfterFullScreen: [
        // DeviceOrientation.landscapeRight,
        // DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
    chewieController.addListener(() {
      if (chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    chewieController.dispose();
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Chewie(
    //     controller: chewieController,
    //   ),
    // );
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Chewie(
            controller: chewieController,
          ),
        ),
      ),
    );
  }
}
