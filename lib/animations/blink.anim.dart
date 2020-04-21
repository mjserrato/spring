import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';

class Blink extends StatefulWidget {
  final Spring spring;
  final Playback playback;
  final Function(AnimationStatus) animStatus;

  Blink({
    @required this.spring,
    @required this.playback,
    this.animStatus,
  });

  @override
  _BlinkState createState() => _BlinkState();
}

class _BlinkState extends State<Blink> {
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track('blink').add(
          widget.spring.animDuration, Tween<double>(begin: 0, end: 1),curve: Curves.fastLinearToSlowEaseIn)
    ]);

    return ControlledAnimation(
      tween: _tween,
      delay: widget.spring.delay,
      duration: widget.spring.animDuration,
      playback: widget.playback,
      animationControllerStatusListener: (status)=>widget.animStatus(status),
      builder: (context, anim) {
        return Opacity(
          opacity: anim['blink'],
          child: widget.spring.child,
        );
      },
    );
  }
}
