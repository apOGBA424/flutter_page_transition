import 'package:flutter/material.dart';

class CustomScaleTransition extends StatefulWidget {
  final Widget pageWidget;
  const CustomScaleTransition({Key? key, required this.pageWidget})
      : super(key: key);

  @override
  State<CustomScaleTransition> createState() => _CustomScaleTransitionState();
}

class _CustomScaleTransitionState extends State<CustomScaleTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    //provide the Animation() some settings using AnimationController()
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    //join both animation and animationController using Tween() package
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: widget.pageWidget,
    );
  }
}
