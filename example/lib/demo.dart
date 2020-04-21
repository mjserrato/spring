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
            animType: AnimType.Fade_Out_Bottom,
            animDuration: Duration(milliseconds: 1000),
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
