// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
// import 'package:page_transition/pages/from_left.dart';

class HorizontalSlidePageTransition extends StatefulWidget {
  final Widget pageWidget;
  final double xAxis;
  // final double yAxis;
  final int slideInMilliseconds;
  bool useDefaultDuration = true;

  HorizontalSlidePageTransition({
    Key? key,
    required this.pageWidget,
    required this.xAxis,
    // required this.yAxis,
    required this.slideInMilliseconds,
    required this.useDefaultDuration,
  }) : super(key: key);

  @override
  State<HorizontalSlidePageTransition> createState() => _HorizontalSlideTransitionState();
}

class _HorizontalSlideTransitionState extends State<HorizontalSlidePageTransition>
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
      begin: Offset(widget.xAxis, 0),
      end: const Offset(0, 0),
    ).animate(animationController);

    //.forward() to activate the controller
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
