import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:spring/spring_kit.dart';
import 'package:spring/springs/spring_rotate.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final _key = GlobalKey<SpringTranslateState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _key.currentState.animate(motion: Motion.Play);
          },
          child: SpringTranslate(
            key: _key,
            motion: Motion.Play,
            animStatus: (status) => null,
            curve: Curves.linear,
            beginOffset: Offset(-100,-200),
            endOffset: Offset.zero,
            child: SizedBox(
              width: 70,
              height: 70,
              child: Card(
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
