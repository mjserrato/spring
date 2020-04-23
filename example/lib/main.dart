import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spring/enum.dart';
import 'package:spring/spring.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SpringExample(AnimType.Rotate),
                SpringExample(AnimType.Blink),
                SpringExample(AnimType.Bubble)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SpringExample(AnimType.Slide_In_Left),
                SpringExample(AnimType.Shake),
                SpringExample(AnimType.Slide_In_Right)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SpringExample(AnimType.FlipY),
                SpringExample(AnimType.FadeIn),
                SpringExample(AnimType.FlipX)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SpringExample(
                  AnimType.Fade_In_Bottom,
                ),
                SpringExample(AnimType.FadeOut),
                SpringExample(AnimType.Fade_In_Right)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SpringExample extends StatefulWidget {
  final AnimType animType;

  SpringExample(this.animType);

  @override
  _SpringExampleState createState() => _SpringExampleState();
}

class _SpringExampleState extends State<SpringExample> {
  final _key = GlobalKey<SpringState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _key.currentState.animate(motion: Motion.Mirror);
      },
      child: Spring(
        key: _key,
        motion: Motion.Mirror,
        animType: widget.animType,
        animStatus: (status) => print(status),
        child: SizedBox(
          width: 70,
          height: 70,
          child: Card(
            color: Colors.red,
            elevation: 10,
          ),
        ),
      ),
    );
  }
}
