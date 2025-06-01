import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double position = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.blue),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.85,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Stack(children: [Ball(), Player(position: position)]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  double newPostion = 0.0;

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () {
      newPostion += 0.1;
    });
    setState(() {});
    return Align(
      alignment: Alignment(0, newPostion),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height * 0.03,
          width: MediaQuery.of(context).size.width * 0.04,
        ),
      ),
    );
  }
}

class Player extends StatefulWidget {
  Player({super.key, this.position = 0.0});
  double position;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          double dxInAlignmentUnits =
              (details.delta.dx /
                  (MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width * 0.1)) *
              2.0;
          widget.position += dxInAlignmentUnits;
        });
      },
      child: Align(
        alignment: Alignment(widget.position, 0.95),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.1,
          ),
        ),
      ),
    );
  }
}
