import 'package:flutter/material.dart';
import 'package:room_movie/helper/extensions.dart';

class GestureScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget? bottomSheet;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  const GestureScaffold(
      {super.key,
      this.body,
      this.bottomSheet,
      this.appBar,
      this.backgroundColor,
      this.floatingActionButton,
      this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.unFocus();
      },
      onHorizontalDragStart: (_) {
        context.unFocus();
      },
      onVerticalDragStart: (_) {
        context.unFocus();
      },
      onTapUp: (_) {
        context.unFocus();
      },
      onTapDown: (_) {
        context.unFocus();
      },
      child: Scaffold(
        backgroundColor: (this).backgroundColor,
        appBar: (this).appBar,
        body: (this).body,
        bottomSheet: (this).bottomSheet,
        floatingActionButton: (this).floatingActionButton,
        bottomNavigationBar: (this).bottomNavigationBar,
      ),
    );
  }
}
