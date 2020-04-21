import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';

class FadeSlide extends StatefulWidget {
  final Spring spring;
  final Playback playback;
  final Offset slideBegin;
  final Offset slideEnd;
  final double fadeBegin;
  final double fadeEnd;
  final Function(AnimationStatus) animStatus;

  FadeSlide(
      {@required this.spring,
      @required this.playback,
      @required this.slideBegin,
      @required this.slideEnd,
      @required this.fadeBegin,
      @required this.fadeEnd,
      this.animStatus});

  @override
  _FadeSlideState createState() => _FadeSlideState();
}

class _FadeSlideState extends State<FadeSlide> {
  @override
  Widget build(BuildContext context) {
    final _tween = MultiTrackTween([
      Track('fade').add(
        widget.spring.animDuration,
        Tween<double>(begin: widget.fadeBegin, end: widget.fadeEnd),
      ),
      Track('slide').add(widget.spring.animDuration,
          Tween<Offset>(begin: widget.slideBegin, end: widget.slideEnd),
          curve: widget.spring.curve)
    ]);

    return ControlledAnimation(
      tween: _tween,
      delay: widget.spring.delay,
      duration: widget.spring.animDuration,
      playback: widget.playback,
      animationControllerStatusListener: (status) => widget.animStatus(status),
      builder: (context, anim) {
        return Opacity(
          opacity: anim['fade'],
          child: Transform.translate(
            offset: anim['slide'],
            child: widget.spring.child,
          ),
        );
      },
    );
  }
}
