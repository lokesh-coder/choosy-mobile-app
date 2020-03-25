import 'dart:math';

import 'package:choosy/widgets/illustration.dart';
import 'package:flutter/material.dart';

class AnimatedPhone extends StatefulWidget {
  AnimatedPhone({Key key}) : super(key: key);

  @override
  _AnimatedPhoneState createState() => _AnimatedPhoneState();
}

class _AnimatedPhoneState extends State<AnimatedPhone>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> rotateAnimation;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() => setState(() {}));

    rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3, 1.0, curve: Curves.easeInSine),
      ),
    );

    scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.1, 0.3, curve: Curves.linear),
      ),
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.scale(
        scale: scaleAnimation.value,
        child: Transform.rotate(
          angle: sin(rotateAnimation.value * pi * 10.0 * 0.3),
          origin: Offset(0, 0),
          child: Opacity(
            opacity: scaleAnimation.value * 0.5,
            child: Illustration('handphone'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }
}
