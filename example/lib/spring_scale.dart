import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class SpringScaleExample extends StatefulWidget {
  @override
  _SpringScaleExampleState createState() => _SpringScaleExampleState();
}

class _SpringScaleExampleState extends State<SpringScaleExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpringScale(
            motion: Motion.Mirror,
            begin: 0.0,
            end: 1.0,
            animStatus: (T) => print(T),
            child: FlutterLogo(
              size: 100,
            )),
      ),
    );
  }
}
