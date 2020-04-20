import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';

class Bubble extends StatefulWidget {
  final Spring spring;
  final Playback playback;

  Bubble({
    @required this.spring,
    @required this.playback,
  });

  @override
  _BubbleState createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track('Bubble').add(
          widget.spring.animDuration, Tween<double>(begin: 0, end: 1),
          curve: Curves.elasticOut)
    ]);

    return ControlledAnimation(
      tween: _tween,
      delay: widget.spring.delay,
      duration: widget.spring.animDuration,
      playback: widget.playback,
      builder: (context, anim) {
        return Transform.scale(
          scale: anim['Bubble'],
          child: widget.spring.child,
        );
      },
    );
  }
}
