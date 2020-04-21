import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';

class Flip extends StatefulWidget {
  final Spring spring;
  final Playback playback;
  final bool flipX;
  final Function(AnimationStatus) animStatus;

  Flip({
    @required this.spring,
    @required this.playback,
    @required this.flipX,
    this.animStatus,
  });

  @override
  _FlipState createState() => _FlipState();
}

class _FlipState extends State<Flip> {
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track('flip').add(
          widget.spring.animDuration, Tween<double>(begin: 0, end: 1),
          curve: widget.spring.curve)
    ]);

    return ControlledAnimation(
      tween: _tween,
      delay: widget.spring.delay,
      duration: widget.spring.animDuration,
      playback: widget.playback,
      animationControllerStatusListener: (status) => widget.animStatus(status),
      child: widget.spring.child,
      builderWithChild: (context, child, anim) {
        return widget.flipX
            ? Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(pi * anim['flip']),
                child: child,
              )
            : Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateX(pi * anim['flip']),
                child: child,
              );
      },
    );
  }
}
