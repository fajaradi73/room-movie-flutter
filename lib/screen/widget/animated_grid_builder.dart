// ignore_for_file: file_names
/*
 * 
 *     animated_grid_builder
 *     Created by Fajar Adi Prasetyo on 04/01/2023
 *     email 	    : fajaradiprast@gmail.com
 *     github 	  : https://github.com/fajaradi73
 *     Copyright © 2023 Fajar Adi Prasetyo All rights reserved.
 */
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedGridBuilder extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final int? itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final Axis? scrollDirection;
  final SliverGridDelegate gridDelegate;
  final ScrollController? controller;

  const AnimatedGridBuilder(
      {Key? key,
      this.padding = EdgeInsets.zero,
      this.shrinkWrap = true,
      this.physics,
      this.scrollDirection,
      this.controller,
      required this.itemCount,
      required this.itemBuilder,
      required this.gridDelegate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        controller: controller,
        padding: padding,
        itemCount: itemCount,
        shrinkWrap: shrinkWrap,
        gridDelegate: gridDelegate,
        scrollDirection: scrollDirection ?? Axis.vertical,
        physics: physics,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              // horizontalOffset: 50.0,
              verticalOffset: 20.0,
              child: FadeInAnimation(
                child: itemBuilder(context, index),
              ),
            ),
          );
        },
      ),
    );
  }
}
