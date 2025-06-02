import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  Player({super.key, this.position = 0.0});
  double position;
  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  double forValidtion = 0;
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
          forValidtion += dxInAlignmentUnits;
          if (forValidtion >= 1) {
            widget.position = 1;
          } else if (forValidtion <= -1) {
            widget.position = -1;
          } else {
            widget.position += dxInAlignmentUnits;
          }
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