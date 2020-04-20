import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';

class Slide extends StatefulWidget {
  final Spring spring;
  final Playback playback;
  final double dx;
  final double dy;

  Slide(
      {@required this.spring,
      @required this.playback,
      @required this.dx,
      @required this.dy});

  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track('slide').add(widget.spring.animDuration,
          Tween<Offset>(begin: Offset(widget.dx, widget.dy), end: Offset.zero),
          curve: widget.spring.curve)
    ]);

    return ControlledAnimation(
      tween: _tween,
      delay: widget.spring.delay,
      duration: widget.spring.animDuration,
      playback: widget.playback,
      builder: (context, anim) {
        return Transform.translate(
          offset: anim['slide'],
          child: widget.spring.child,
        );
      },
    );
  }
}
