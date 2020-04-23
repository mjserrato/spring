import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class SpringTranslateExample extends StatefulWidget {
  @override
  _SpringTranslateExampleState createState() => _SpringTranslateExampleState();
}

class _SpringTranslateExampleState extends State<SpringTranslateExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpringTranslate(
            motion: Motion.Mirror,
            beginOffset: Offset(100, 200),
            endOffset: Offset.zero,
            animStatus: (T) => print(T),
            child: FlutterLogo(
              size: 100,
            )),
      ),
    );
  }
}
