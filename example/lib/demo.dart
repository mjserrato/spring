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
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _key.currentState.animate(motion: Motion.Play);
            },
            child: Spring(
              animType: AnimType.Slide_Out_Bottom,
              key: _key,
              autoPlay: true,
              curve: Curves.linear,
              animDuration: Duration(seconds: 2),
              delay: Duration(milliseconds:0),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Card(
                  elevation: 10,
                  color: Colors.pink,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
