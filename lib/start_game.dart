import 'package:flutter/material.dart';

class StartGame extends StatefulWidget {
  StartGame({super.key, this.isStart = false});
  bool isStart;

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  @override
  Widget build(BuildContext context) {
    return widget.isStart
        ? SizedBox.shrink()
        : GestureDetector(
          onTap: () {
            widget.isStart = true;
            setState(() {});
          },
          child: Align(
            alignment: Alignment(0, 1),
            child: Center(
              child: Text(
                "Tap To Start The Game",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        );
  }
}
