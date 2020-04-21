import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/enum.dart';

class SpringTranslate extends StatefulWidget {
  final GlobalKey<SpringTranslateState> key;
  final Motion motion;
  final Offset beginOffset;
  final Offset endOffset;
  final Duration delay;
  final Duration animDuration;
  final Curve curve;
  final Function(AnimationStatus) animStatus;
  final Widget child;

  SpringTranslate(
      {this.key,
      @required this.motion,
      @required this.beginOffset,
      @required this.endOffset,
      this.delay: const Duration(milliseconds: 0),
      this.animDuration: const Duration(milliseconds: 1000),
      this.curve: Curves.linear,
      @required this.animStatus,
      @required this.child});

  @override
  SpringTranslateState createState() => SpringTranslateState();
}

class SpringTranslateState extends State<SpringTranslate> {
  Playback _playback = Playback.PLAY_FORWARD;

  @override
  void initState() {
    setState(() {
      switch (widget.motion) {
        case Motion.Play:
          _playback = Playback.PLAY_FORWARD;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track('translate').add(widget.animDuration,
          Tween<Offset>(begin: widget.beginOffset, end: widget.endOffset),
          curve: widget.curve)
    ]);

    return ControlledAnimation(
      tween: _tween,
      duration: _tween.duration,
      delay: widget.delay,
      animationControllerStatusListener: (status) => widget.animStatus(status),
      playback: _playback,
      child: widget.child,
      builderWithChild: (context, child, anim) {
        return Transform.translate(
          offset: anim['translate'],
          child: child,
        );
      },
    );
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
