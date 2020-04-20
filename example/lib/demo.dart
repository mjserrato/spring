import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:spring/spring_kit.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final _key = GlobalKey<SpringState>();
  final _key2 = GlobalKey<SpringState>();
  final _slfT=GlobalKey<SpringState>();
  final _slfB=GlobalKey<SpringState>();

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
              _slfT.currentState.animate(motion: Motion.Play);
            },
            child: SizedBox(
              width: 80,
              height: 80,
              child: Spring(
                  key: _slfT,
                  animType: AnimType.Slide_From_Top,
                  delay: Duration(milliseconds: 500),
                  child: Card(
                    elevation: 10,
                    color: Colors.yellow,
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              _key.currentState.animate(motion: Motion.Play);
            },
            child: SizedBox(
              width: 80,
              height: 80,
              child: Spring(
                  key: _key,
                  animType: AnimType.Slide_From_Left,
                  delay: Duration(milliseconds: 3000),
                  child: Card(
                    elevation: 10,
                    color: Colors.red,
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              _key2.currentState.animate(motion: Motion.Play);
            },
            child: SizedBox(
              width: 80,
              height: 80,
              child: Spring(
                  key: _key2,
                  animType: AnimType.Slide_From_Right,
                  animDuration: Duration(milliseconds:5000),
                  delay: Duration(milliseconds: 3000),
                  child: Card(
                    elevation: 10,
                    color: Colors.pinkAccent,
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              _slfB.currentState.animate(motion: Motion.Play);
            },
            child: SizedBox(
              width: 80,
              height: 80,
              child: Spring(
                  key: _slfB,
                  animType: AnimType.Slide_From_Bottom,
                  animDuration: Duration(milliseconds:1000),
                  delay: Duration(milliseconds: 1000),
                  child: Card(
                    elevation: 10,
                    color: Colors.pinkAccent,
                  )),
            ),
          ),

        ],
      )),
    );
  }
}
