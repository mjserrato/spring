import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:spring/animations/blink.anim.dart';
import 'package:spring/animations/bubble.anim.dart';
import 'package:spring/animations/fade.dart';
import 'package:spring/animations/fade_slide.dart';
import 'package:spring/animations/flip.dart';
import 'package:spring/animations/pop.dart';
import 'package:spring/animations/rotate.anim.dart';
import 'package:spring/animations/shake.anim.dart';
import 'package:spring/enum.dart';
import 'package:sized_context/sized_context.dart';
import 'animations/slide.anim.dart';

class Spring extends StatefulWidget {
  final GlobalKey<SpringState> key;
  final AnimType animType;
  final Motion motion;
  final Duration delay;
  final Duration animDuration;
  final Curve curve;
  final Function(AnimationStatus) animStatus;
  final Widget child;

  Spring(
      {this.key,
      @required this.animType,
      @required this.motion,
      this.delay: const Duration(milliseconds: 0),
      this.animDuration: const Duration(milliseconds: 1000),
      this.curve: Curves.elasticOut,
      this.animStatus,
      @required this.child});

  @override
  SpringState createState() => SpringState();
}

class SpringState extends State<Spring> {
  Playback _playback = Playback.PLAY_FORWARD;



  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        switch (widget.motion) {
          case Motion.Play:
            _playback = Playback.START_OVER_FORWARD;
            break;
          case Motion.Pause:
            _playback = Playback.PAUSE;
            break;
          case Motion.Reverse:
            _playback = Playback.START_OVER_REVERSE;
            break;
          case Motion.Loop:
            _playback = Playback.LOOP;
            break;
          case Motion.Mirror:
            _playback = Playback.MIRROR;
            break;
        }
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
            begin: Offset(context.widthPx / 2 + 100, 0),
            end: Offset.zero,
            animStatus: (status) => widget.animStatus(status),
          );
        }
        break;
      case AnimType.Fade_In_Right:
        {
          return FadeSlide(
            spring: widget,
            playback: playback,
            fadeBegin: 0.0,
            fadeEnd: 1.0,
            slideBegin: Offset(context.widthPx / 2 + 100, 0),
            slideEnd: Offset.zero,
            animStatus: (status) => widget.animStatus(status),
          );
        }
        break;
      case AnimType.Slide_In_Left:
        return Slide(
          spring: widget,
          playback: playback,
          begin: Offset(-context.widthPx / 2 - 100, 0),
          end: Offset.zero,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Fade_In_Left:
        {
          return FadeSlide(
            spring: widget,
            playback: playback,
            fadeBegin: 0.0,
            fadeEnd: 1.0,
            slideBegin: Offset(-context.widthPx / 2 - 100, 0),
            slideEnd: Offset.zero,
            animStatus: (status) => widget.animStatus(status),
          );
        }
        break;
      case AnimType.Slide_In_Top:
        return Slide(
          spring: widget,
          playback: playback,
          begin: Offset(0, -context.heightPx / 2 - 100),
          end: Offset.zero,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Fade_In_Top:
        return FadeSlide(
          spring: widget,
          playback: playback,
          fadeBegin: 0.0,
          fadeEnd: 1.0,
          slideBegin: Offset(0, -context.heightPx / 2 - 100),
          slideEnd: Offset.zero,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Slide_In_Bottom:
        return Slide(
          spring: widget,
          playback: playback,
          begin: Offset(0, context.heightPx / 2 + 100),
          end: Offset.zero,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Fade_In_Bottom:
        return FadeSlide(
          spring: widget,
          playback: playback,
          fadeBegin: 0.0,
          fadeEnd: 1.0,
          slideBegin: Offset(0, context.heightPx / 2 + 100),
          slideEnd: Offset.zero,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Slide_Out_Right:
        return Slide(
          spring: widget,
          playback: playback,
          begin: Offset.zero,
          end: Offset(context.widthPx / 2 + 100, 0),
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Fade_Out_Right:
        return FadeSlide(
          spring: widget,
          playback: playback,
          fadeBegin: 1.0,
          fadeEnd: 0.0,
          slideBegin: Offset.zero,
          slideEnd: Offset(context.widthPx / 2 + 100, 0),
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Slide_Out_Left:
        return Slide(
          spring: widget,
          playback: playback,
          end: Offset(-context.widthPx / 2 - 100, 0),
          begin: Offset.zero,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Fade_Out_Left:
        return FadeSlide(
          spring: widget,
          playback: playback,
          fadeBegin: 1.0,
          fadeEnd: 0.0,
          slideBegin: Offset.zero,
          slideEnd: Offset(-context.widthPx / 2 - 100, 0),
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Slide_Out_Top:
        return Slide(
          spring: widget,
          playback: playback,
          end: Offset(0, -context.heightPx / 2 - 100),
          begin: Offset.zero,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Fade_Out_Top:
        return FadeSlide(
          spring: widget,
          playback: playback,
          fadeEnd: 0.0,
          fadeBegin: 1.0,
          slideEnd: Offset(0, -context.heightPx / 2 - 100),
          slideBegin: Offset.zero,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Slide_Out_Bottom:
        return Slide(
          spring: widget,
          playback: playback,
          end: Offset(0, context.heightPx / 2 + 100),
          begin: Offset.zero,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Fade_Out_Bottom:
        return FadeSlide(
          spring: widget,
          playback: playback,
          fadeEnd: 0.0,
          fadeBegin: 1.0,
          slideEnd: Offset(0, context.heightPx / 2 + 100),
          slideBegin: Offset.zero,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Bubble:
        return Bubble(
          spring: widget,
          playback: playback,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.FadeIn:
        return Fade(
            spring: widget,
            playback: playback,
            start: 0.0,
            end: 1.0,
            animStatus: (status) => widget.animStatus(status));
        break;
      case AnimType.FadeOut:
        return Fade(
          spring: widget,
          playback: playback,
          start: 1.0,
          end: 0.0,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Shake:
        return Shake(
          spring: widget,
          playback: playback,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Rotate:
        return Rotate(
          spring: widget,
          playback: playback,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.Blink:
        return Blink(
          spring: widget,
          animStatus: (status) => widget.animStatus(status),
        );
        break;
      case AnimType.FlipX:
        return Flip(
            flipX: true,
            spring: widget,
            playback: playback,
            animStatus: (status) => widget.animStatus(status));
        break;
      case AnimType.FlipY:
        return Flip(
            flipX: false,
            spring: widget,
            playback: playback,
            animStatus: (status) => widget.animStatus(status));
        break;
      case AnimType.PoP:
        return Pop(
            spring: widget,
            playback: playback,
            animStatus: (status) => widget.animStatus(status));
        break;

      default:
        return widget.child;
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
