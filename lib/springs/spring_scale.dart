import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/enum.dart';

class SpringScale extends StatefulWidget {
  final GlobalKey<SpringScaleState> key;
  final Motion motion;
  final double begin;
  final double end;
  final Duration delay;
  final Duration animDuration;
  final Curve curve;
  final Function(AnimationStatus) animStatus;
  final Alignment alignment;
  final Offset offset;
  final Widget child;

  SpringScale(
      {this.key,
      @required this.motion,
      @required this.begin,
      @required this.end,
      this.delay: const Duration(milliseconds: 0),
      this.animDuration: const Duration(milliseconds: 1000),
      this.curve: Curves.linear,
      @required this.animStatus,
      this.alignment: Alignment.center,
      this.offset,
      @required this.child});

  @override
  SpringScaleState createState() => SpringScaleState();
}

class SpringScaleState extends State<SpringScale> {
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
      Track('scale').add(widget.animDuration,
          Tween<double>(begin: widget.begin, end: widget.end),
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
        return Transform.scale(
          scale: anim['scale'],
          alignment: widget.alignment,
          origin: widget.offset,
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
