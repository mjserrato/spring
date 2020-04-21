import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:spring/animations/bubble.anim.dart';
import 'package:spring/animations/fade.dart';
import 'package:spring/animations/shake.anim.dart';
import 'package:spring/enum.dart';
import 'package:sized_context/sized_context.dart';
import 'animations/slide.anim.dart';

class Spring extends StatefulWidget {
  final GlobalKey<SpringState> key;
  final AnimType animType;
  final bool autoPlay;
  final Duration delay;
  final Duration animDuration;
  final Curve curve;
  final Widget child;

  Spring(
      {this.key,
      @required this.animType,
      this.autoPlay: true,
      this.delay: const Duration(milliseconds: 0),
      @required this.animDuration,
      this.curve: Curves.elasticOut,
      this.child});

  @override
  SpringState createState() => SpringState();
}

class SpringState extends State<Spring> {
  Playback _playback = Playback.PLAY_FORWARD;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        _playback = widget.autoPlay ? Playback.PLAY_FORWARD : Playback.PAUSE;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return getTweenWidget(_playback);
  }

  Widget getTweenWidget(Playback playback) {
    switch (widget.animType) {
      case AnimType.Slide_In_Right:
        {
          return Slide(
            spring: widget,
            playback: playback,
            begin: Offset(context.widthPx/2 +100, 0),
            end: Offset.zero,
          );
        }
        break;
      case AnimType.Slide_In_Left:
        return Slide(
          spring: widget,
          playback: playback,
          begin: Offset(-context.widthPx/2 - 100, 0),
          end: Offset.zero,
        );
        break;
      case AnimType.Slide_In_Top:
        return Slide(
          spring: widget,
          playback: playback,
          begin: Offset(0, -context.heightPx/2- 100),
          end: Offset.zero,
        );
        break;
      case AnimType.Slide_In_Bottom:
        return Slide(
          spring: widget,
          playback: playback,
          begin: Offset(0, context.heightPx/2 + 100),
          end: Offset.zero,
        );
        break;
      case AnimType.Slide_Out_Right:
        return Slide(
          spring: widget,
          playback: playback,
          begin: Offset.zero,
          end: Offset(context.widthPx/2 + 100, 0),
        );
        break;
      case AnimType.Slide_Out_Left:
        return Slide(
          spring: widget,
          playback: playback,
          end: Offset(-context.widthPx/2 - 100, 0),
          begin: Offset.zero,
        );
        break;
      case AnimType.Slide_Out_Top:
        return Slide(
          spring: widget,
          playback: playback,
          end: Offset(0, -context.heightPx/2 - 100),
          begin: Offset.zero,
        );
        break;
      case AnimType.Slide_Out_Bottom:
        return Slide(
          spring: widget,
          playback: playback,
          end: Offset(0, context.heightPx/2 + 100),
          begin: Offset.zero,
        );
        break;
      case AnimType.Bubble:
        return Bubble(spring: widget, playback: playback);
        break;
      case AnimType.FadeIn:
        return Fade(spring: widget, playback: playback, start: 0.0, end: 1.0);
        break;
      case AnimType.FadeOut:
        return Fade(spring: widget, playback: playback, start: 1.0, end: 0.0);
        break;
      case AnimType.Shake:
        return Shake(spring: widget, playback: playback);
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
