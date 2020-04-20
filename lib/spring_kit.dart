import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:spring/enum.dart';
import 'package:sized_context/sized_context.dart';
import 'animations/slide.dart';

class Spring extends StatefulWidget {
  final GlobalKey<SpringState> key;
  final AnimType animType;
  final Duration delay;
  final Duration animDuration;
  final Curve curve;
  final Widget child;

  Spring(
      {this.key,
      @required this.animType,
      this.delay: const Duration(milliseconds: 0),
      this.animDuration: const Duration(milliseconds: 1000),
      this.curve: Curves.elasticOut,
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
      case AnimType.Slide_From_Right:
        {
          return Slide(
              spring: widget,
              playback: playback,
              dx: context.widthPx + 100,
              dy: 0);
        }
        break;
      case AnimType.Slide_From_Left:
        return Slide(
            spring: widget,
            playback: playback,
            dx: -context.widthPx - 100,
            dy: 0);
        break;
      case AnimType.Slide_From_Top:
        return Slide(
            spring: widget,
            playback: playback,
            dx: 0,
            dy: -context.heightPx - 100);
        break;
      case AnimType.Slide_From_Bottom:
        return Slide(
            spring: widget,
            playback: playback,
            dx: 0,
            dy: context.heightPx + 100);
        break;
    }
  }

  void animate({@required Motion motion}) {
    setState(() {
      switch (motion) {
        case Motion.Play:
          {
            _playback = Playback.START_OVER_FORWARD;
          }
          break;
        case Motion.Pause:
          {
            _playback = Playback.PAUSE;
          }
          break;
        case Motion.Reverse:
          {
            _playback = Playback.START_OVER_REVERSE;
          }
          break;
        case Motion.Loop:
          {
            _playback = Playback.LOOP;
          }
          break;
        case Motion.Mirror:
          {
            _playback = Playback.MIRROR;
          }
          break;
      }
    });
  }
}
