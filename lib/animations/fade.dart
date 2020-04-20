import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';

class Fade extends StatefulWidget {
  final Spring spring;
  final Playback playback;
  final double start;
  final double end;

  Fade({
    @required this.spring,
    @required this.playback,
    @required this.start ,
    @required this.end,
  });

  @override
  _FadeState createState() => _FadeState();
}

class _FadeState extends State<Fade> {
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track('fade').add(
          widget.spring.animDuration, Tween(begin: widget.start, end: widget.end),)
    ]);

    return ControlledAnimation(
      tween: _tween,
      delay: widget.spring.delay,
      duration: widget.spring.animDuration,
      playback: widget.playback,
      builder: (context, anim) {
        return Opacity(
          opacity: anim['fade'],
          child: widget.spring.child,
        );
      },
    );
  }
}
