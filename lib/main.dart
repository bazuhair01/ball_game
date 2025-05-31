import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(children: [
        Container(
          color: Colors.blue,
        ),
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
                  children: [
                    Container(
                      color: Colors.black,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical : 20),
                                child: Container(
                                  color: Colors.black,
                                  height: MediaQuery.of(context).size.height * 0.02,
                                  width: MediaQuery.of(context).size.width * 0.1,
                                  child: GestureDetector(
                                    onTap: () {
                                      
                                    },
                                  ),
                                ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
        ],
      ),
    );
  }
}
