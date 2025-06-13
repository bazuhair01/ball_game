import 'dart:async';

import 'package:flutter/material.dart';

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  double newPostion = 0.0;

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        newPostion += 0.01;
      });
    });
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment(0, newPostion),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.04,
          ),
        ),
      ),
    );
  }
}