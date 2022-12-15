import 'dart:async';

import 'package:flutter/material.dart';
import 'package:room_movie/helper/extensions.dart';

enum TBarType { error, success }

class DismissableUpperSnackBar extends StatefulWidget {
  final String message;
  final bool showClose;
  final Color backgroundColor;
  final List<BoxShadow> boxShadow;
  final Function()? onClose;
  final BorderRadius borderRadius;

  const DismissableUpperSnackBar.success({
    Key? key,
    required this.message,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.backgroundColor = Colors.green,
    this.showClose = false,
    this.onClose,
    this.boxShadow = const [
      BoxShadow(
        color: Colors.black26,
        offset: Offset(0.0, 8.0),
        spreadRadius: 1,
        blurRadius: 30,
      ),
    ],
  }) : super(key: key);

  const DismissableUpperSnackBar.error({
    Key? key,
    required this.message,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.backgroundColor = const Color(0xffff5252),
    this.onClose,
    this.showClose = false,
    this.boxShadow = const [
      BoxShadow(
        color: Colors.black26,
        offset: Offset(0.0, 8.0),
        spreadRadius: 1,
        blurRadius: 30,
      ),
    ],
  }) : super(key: key);

  @override
  State<DismissableUpperSnackBar> createState() =>
      _DismissableUpperSnackBarState();
}

class _DismissableUpperSnackBarState extends State<DismissableUpperSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 13),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: widget.boxShadow,
        borderRadius: widget.borderRadius,
      ),
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0.fontSize(),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Visibility(
            visible: widget.showClose,
            child: GestureDetector(
              onTap: () {
                if (widget.onClose != null) {
                  widget.onClose!();
                }
              },
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DismissableTopSnackBar extends StatefulWidget {
  final VoidCallback onDismissed;
  final String message;
  final Duration showOutAnimationDuration;
  final Duration hideOutAnimationDuration;
  final Duration displayDuration;
  final double? additionalTopPadding;
  final VoidCallback? onTap;
  final double leftPadding, rightPadding;
  final TBarType type;

  const DismissableTopSnackBar({
    Key? key,
    required this.message,
    required this.onDismissed,
    required this.showOutAnimationDuration,
    required this.hideOutAnimationDuration,
    required this.displayDuration,
    required this.additionalTopPadding,
    this.type = TBarType.error,
    this.onTap,
    this.leftPadding = 16,
    this.rightPadding = 16,
  }) : super(key: key);

  @override
  State<DismissableTopSnackBar> createState() => _DismissableTopSnackBarState();
}

class _DismissableTopSnackBarState extends State<DismissableTopSnackBar>
    with SingleTickerProviderStateMixin {
  late Animation offsetAnimation;
  late AnimationController animationController;
  double? topPosition;

  late Timer showingTimer;

  @override
  void initState() {
    topPosition = widget.additionalTopPadding;
    _setupAndStartAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.showOutAnimationDuration,
      reverseDuration: widget.hideOutAnimationDuration,
    );

    Tween<Offset> offsetTween = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    );

    offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
        reverseCurve: Curves.linearToEaseOut,
      ),
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          showingTimer = Timer(
            widget.displayDuration,
            () {
              if (mounted) {
                animationController.reverse();
                setState(() {
                  topPosition = 0;
                });
              }
            },
          );
        }

        if (status == AnimationStatus.dismissed) {
          widget.onDismissed.call();
        }
      });

    if (mounted) {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget.hideOutAnimationDuration * 1.5,
      curve: Curves.linearToEaseOut,
      top: topPosition,
      left: widget.leftPadding,
      right: widget.rightPadding,
      child: SlideTransition(
        position: offsetAnimation as Animation<Offset>,
        child: SafeArea(
          child: TapBounceContainer(
            onTap: () {
              if (mounted) {
                showingTimer.cancel();
                widget.onTap?.call();
                animationController.reverse();
              }
            },
            child: (widget.type == TBarType.success).widget(
              trueV: DismissableUpperSnackBar.success(
                message: widget.message,
                showClose: true,
                onClose: () {
                  showingTimer.cancel();
                  animationController.reverse();
                },
              ),
              falseV: DismissableUpperSnackBar.error(
                message: widget.message,
                showClose: true,
                onClose: () {
                  showingTimer.cancel();
                  animationController.reverse();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TapBounceContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const TapBounceContainer({
    required this.child,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  State<TapBounceContainer> createState() => _TapBounceContainerState();
}

class _TapBounceContainerState extends State<TapBounceContainer>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  final animationDuration = const Duration(milliseconds: 200);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
      lowerBound: 0.0,
      upperBound: 0.04,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onPanEnd: _onPanEnd,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    if (mounted) {
      _controller.forward();
    }
  }

  void _onTapUp(TapUpDetails details) async {
    await _closeSnackBar();
  }

  void _onPanEnd(DragEndDetails details) async {
    await _closeSnackBar();
  }

  Future _closeSnackBar() async {
    if (mounted) {
      _controller.reverse();
      await Future.delayed(animationDuration);
      widget.onTap?.call();
    }
  }
}
