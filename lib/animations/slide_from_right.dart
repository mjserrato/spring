import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sized_context/sized_context.dart';
import 'package:spring/spring.dart';

class SlideFromRight extends StatefulWidget {
  final Spring spring;
  final Playback playback;

  SlideFromRight({@required this.spring, @required this.playback});

  @override
  _SlideFromRightState createState() => _SlideFromRightState();
}

class _SlideFromRightState extends State<SlideFromRight> {
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track('slide').add(
          Duration(milliseconds: 1000),
          Tween<Offset>(
              begin: Offset(-context.widthPx - 100, 0), end: Offset.zero))
    ]);

    return ControlledAnimation(
      tween: _tween,
      duration: widget.spring.delay,
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
