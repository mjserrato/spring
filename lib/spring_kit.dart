import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/enum.dart';

import 'animations/slide_from_right.dart';

class Spring extends StatefulWidget {

  final GlobalKey<SpringState> key;
  final AnimType animType;
  final Duration delay;
  final Widget child;

  Spring(
      {this.key,
      @required this.animType,
      this.delay: const Duration(milliseconds: 0),
      this.child});

  @override
  SpringState createState() => SpringState();
}

class SpringState extends State<Spring> {
  Playback _playback = Playback.PLAY_FORWARD;

  @override
  Widget build(BuildContext context) {
    return getTweenWidget(_playback);
  }

  Widget getTweenWidget(Playback playback) {
    switch (widget.animType) {
      case AnimType.Slide_right:
        return SlideFromRight(
          playback: playback,
          spring: widget,
        );
        break;
      default:
        return widget.child;
    }
  }

  void animate() {
    setState(() {
      _playback = Playback.START_OVER_FORWARD;
    });
  }
}
