import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';

class Pop extends StatefulWidget {
  final Spring spring;
  final Playback playback;
  final Function(AnimationStatus) animStatus;

  Pop({
    @required this.spring,
    @required this.playback,
    this.animStatus,
  });

  @override
  _PopState createState() => _PopState();
}

class _PopState extends State<Pop> {
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track('pop').add(
          widget.spring.animDuration, Tween<double>(begin: 1, end: 0),
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
        return Transform.scale(
          scale: anim['pop'],
          child: child,
        );
      },
    );
  }
}
