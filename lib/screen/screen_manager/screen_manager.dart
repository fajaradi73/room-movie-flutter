import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:room_movie/helper/extensions.dart';

import '../../bloc/app_manager.dart';

class ScreenManager extends StatelessWidget {
  final appController = Get.find<AppManager>();
  final Widget child;

  ScreenManager({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: (this).child,
    );
  }
}
