import 'package:ball_game/ball.dart';
import 'package:ball_game/player.dart';
import 'package:ball_game/start_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    return Stack(
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
                child: Stack(
                  children: [StartGame(), Ball(), Player(position: position)],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}