import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bloc.dart';

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
