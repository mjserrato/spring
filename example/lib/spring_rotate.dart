import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class SpringRotateExample extends StatefulWidget {
  @override
  _SpringRotateExampleState createState() => _SpringRotateExampleState();
}

class _SpringRotateExampleState extends State<SpringRotateExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpringRotate(
            motion: Motion.Mirror,
            begin: 2.0,
            end: 6.0,
            animStatus: (T) => print(T),
            child: FlutterLogo(
              size: 100,
            )),
      ),
    );
  }
}
