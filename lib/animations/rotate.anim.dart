import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';

class Rotate extends StatefulWidget {
  final Spring spring;
  final Playback playback;
  final Function(AnimationStatus) animStatus;

  Rotate({
    @required this.spring,
    @required this.playback,
    this.animStatus,
  });

  @override
  _RotateState createState() => _RotateState();
}

class _RotateState extends State<Rotate> {
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track("rotation").add(Duration(seconds: 1), ConstantTween(0.0)).add(Duration(seconds: 3),
            Tween(begin: 0.0, end: pi / 1),curve: widget.spring.curve
          )
    ]);

    return ControlledAnimation(
      tween: _tween,
      delay: widget.spring.delay,
      duration: widget.spring.animDuration,
      playback: widget.playback,
      child: widget.spring.child,
      animationControllerStatusListener: (status)=>widget.animStatus(status),
      builderWithChild: (context, child, anim) {
        return Transform.rotate(
          angle: anim["rotation"],
          child: child,
        );
      },
    );
  }
}
