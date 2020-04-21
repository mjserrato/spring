import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:spring/spring_kit.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final _key = GlobalKey<SpringScaleState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            _key.currentState.animate(motion: Motion.Play);
          },
          child: SpringScale(
            key: _key,
            motion: Motion.Pause,
            animStatus: (status) => null,
            curve: Curves.elasticOut,
            begin: 0.5,
            end: 1.0,
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
