import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';
import 'package:vector_math/vector_math_64.dart';

class Shake extends StatefulWidget {
  final Spring spring;
  final Playback playback;
  final Function(AnimationStatus) animStatus;

  Shake({
    @required this.spring,
    @required this.playback,
    this.animStatus,
  });

  @override
  _ShakeState createState() => _ShakeState();
}

class _ShakeState extends State<Shake> {
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track('shake').add(
        widget.spring.animDuration,
        Tween<double>(begin: 50, end: 120),
      )
    ]);

    return ControlledAnimation(
      tween: _tween,
      delay: widget.spring.delay,
      duration: widget.spring.animDuration,
      playback: widget.playback,
      animationControllerStatusListener: (status) => widget.animStatus(status),
      builder: (context, anim) {
        return Transform(
          child: widget.spring.child,
          transform: Matrix4.translation(_shake(anim['shake'])),
        );
      },
    );
  }

  Vector3 _shake(double progress) {
    double offset = sin(progress * pi * 10.0);
    return Vector3(offset * 4, 0.0, 0.0);
  }
}
