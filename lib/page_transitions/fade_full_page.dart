import 'package:flutter/material.dart';

class FullPageTransition extends StatefulWidget {
  final Widget pageWidget;
  const FullPageTransition({Key? key, required this.pageWidget})
      : super(key: key);

  @override
  State<FullPageTransition> createState() => _FullPageTransitionState();
}

class _FullPageTransitionState extends State<FullPageTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    //provide the Animation() some settings using AnimationController()
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
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
    return FadeTransition(
      opacity: animation,
      child: widget.pageWidget,
    );
  }
}
