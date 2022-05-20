// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class VerticalSlidePageTransition extends StatefulWidget {
  final Widget pageWidget;

  final double yAxis;
  final int slideInMilliseconds;
  bool useDefaultDuration = true;

  VerticalSlidePageTransition({
    Key? key,
    required this.pageWidget,
    required this.yAxis,
    required this.slideInMilliseconds,
    required this.useDefaultDuration,
  }) : super(key: key);

  @override
  State<VerticalSlidePageTransition> createState() =>
      _VerticalSlidePageTransitionState();
}

class _VerticalSlidePageTransitionState
    extends State<VerticalSlidePageTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    //provide the Animation() some settings using AnimationController()
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: widget.useDefaultDuration == true
              ? 200
              : widget.slideInMilliseconds),
    );

    //join both animation and animationController using Tween() package
    animation = Tween(
      begin: Offset(0, widget.yAxis),
      end: const Offset(0, 0),
    ).animate(animationController);

    //use .forward() to activate the controller
    animationController.forward();
    super.initState();
  }

  //.dispose() deactivates the controller when app is kill
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: widget.pageWidget,
    );
  }
}
