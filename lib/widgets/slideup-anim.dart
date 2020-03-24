import 'package:flutter/material.dart';

class SlideUpAnimation extends StatelessWidget {
  final Widget child;
  final AnimationController controller;

  final Animation<double> moveY;
  final Animation<double> fadeIn;

  SlideUpAnimation({this.child, this.controller})
      : moveY = Tween<double>(
          begin: 150.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ),
        ),
        fadeIn = Tween(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.ease,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, moveY.value),
      child: Opacity(
        opacity: fadeIn.value,
        child: child,
      ),
    );
  }
}
