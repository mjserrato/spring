import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:spring/spring_kit.dart';

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
            _key.currentState.animate();
          },
          child: Spring(
            key: _key,
            animType: AnimType.Slide_right,
            delay: Duration(milliseconds: 3000),
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
