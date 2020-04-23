# Spring

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

Spring is a simple & power full animation kit. inspired by Android's Flubber.
Spring provide pre built fully customizable animation to boost your productivty.

![Spring](https://github.com/KaushickSArgekar/spring/blob/master/doc/spring.gif)

## Customizable pre-built animations
  -  Slide_In_Right
  -  Fade_In_Right
  -  Slide_In_Left
  -  Fade_In_Left
  -  Slide_In_Top
  -  Fade_In_Top
  -  Slide_In_Bottom
  -  Fade_In_Bottom
  -  Slide_Out_Right
  -  Fade_Out_Right
  -  Slide_Out_Left
  -  Fade_Out_Left
  -  Slide_Out_Top
  -  Fade_Out_Top
  -  Slide_Out_Bottom
  -  Fade_Out_Bottom
  -  FadeIn
  -  FadeOut
  -  Bubble
  -  Rotate
  -  Shake
  -  PoP
  -  FlipX
  -  FlipY
  -  Blink

## Usage:-

``` dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final _key = GlobalKey<SpringState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _key.currentState.animate(motion: Motion.Mirror);
          },
          child: Spring(
            key: _key,
            delay: Duration(milliseconds: 100),
            animType: AnimType.Slide_In_Right,
            autoPlay: true,
            animDuration: Duration(milliseconds: 7000),
            animStatus: (status) => null,
            curve: Curves.elasticInOut,
            child: SizedBox(
              width: 70,
              height: 70,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 10,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

## Controlling the animations

You can controll the animation using the SpringState Key.

``` dart
final _key = GlobalKey<SpringState>();

Spring(
  key=_key
);

_key. _key.currentState.animate(motion: Motion.Loop); //you can call this on button click or inside methods.

```

### Motion types.
You can set the animation playback using Motion.

Spring Motion types.
*  Motion.Play
*  Motion.Pause
*  Motion.Loop
*  Motion.Mirror
*  Motion.Reverse

# Spring Super Widgets.

## SpringTranslate

<img src="https://github.com/KaushickSArgekar/spring/blob/master/doc/translate.gif" width="120" height="240">

``` dart
SpringTranslate(
    motion: Motion.Mirror,
    beginOffset: Offset(100, 200),
    endOffset: Offset.zero,
    animStatus: (T) => print(T),
    child: FlutterLogo(
    size: 100,
));
```
## SpringScale

<img src="https://github.com/KaushickSArgekar/spring/blob/master/doc/scale.gif" width="120" height="240">

``` dart
 SpringScale(
    motion: Motion.Mirror,
    begin: 0.0,
    end: 1.0,
    animStatus: (T) => print(T),
    child: FlutterLogo(
        size: 100,
    )),
```

## SpringRotate
<img src="https://github.com/KaushickSArgekar/spring/blob/master/doc/rotate.gif" width="120" height="240">


``` dart
SpringRotate(
    motion: Motion.Mirror,
    begin: 2.0,
    end: 6.0,
    animStatus: (T) => print(T),
    child: FlutterLogo(
             size: 100,
    )),
```


### Development

Want to contribute? Great!
