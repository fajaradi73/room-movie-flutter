// ignore_for_file: file_names
/*
 *     Created by Fajar Adi Prasetyo on 06/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../gen_theme/assets.gen.dart';
import '../../util/constant.dart';

class ImageView extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  final BoxFit? fit;

  const ImageView(
      {Key? key, this.url, this.width = 0.0, this.height = 0.0, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // const Center(
      //     child: LoadingScreen(
      //   height: 25,
      //   width: 25,
      // )),
      SizedBox(
          width: double.infinity,
          height: double.infinity,
          // color: Theme.of(context).cardTheme.color,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            placeholderFit: BoxFit.contain,
            image: url?.contains("https") == true
                ? "$url"
                : "${Constant.baseImage}$url",
            imageErrorBuilder: (context, error, stackTrace) {
              return Container(
                // color: Theme.of(context).cardTheme.color,
                child: Assets.images.noImage.image(
                    width: width != 0.0 ? width : null,
                    height: height != 0.0 ? height : null,
                    color: Colors.black),
              );
            },
            fit: fit,
            width: width != 0.0 ? width : null,
            height: height != 0.0 ? height : null,
          )
          // child: Image.network(
          //   url != null ? "${Constant.baseImage}$url" : Constant.transparentImage,
          //   fit: fit,
          //   width: width != 0.0 ? width : null,
          //   height: height != 0.0 ? height : null,
          //   loadingBuilder: (context, child, loadingProgress) {
          //     if (loadingProgress == null) {
          //       return child;
          //     } else {
          //       return const Center(
          //           child: LoadingScreen(
          //         height: 25,
          //         width: 25,
          //       ));
          //     }
          //   },
          //   errorBuilder: (context, error, stackTrace) {
          //     return Assets.images.noImage.image(
          //         width: width != 0.0 ? width : null,
          //         height: height != 0.0 ? height : null,
          //         color: Colors.black);
          //   },
          // ),
          )
    ]);
  }
}
