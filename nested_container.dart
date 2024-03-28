import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Layout Demo'),
        ),
        body: false
            ? HugeColumn(childCount: 100)
            : RecursiveNestContainer(nestLimit: 100, nestCount: 0),
      ),
    );
  }
}

class RecursiveNestContainer extends StatelessWidget {
  const RecursiveNestContainer({
    required this.nestLimit,
    required this.nestCount,
  });

  final int nestLimit;
  final int nestCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      color: nestCount % 2 == 0
          ? Color.fromARGB(
              255 - (255 * nestCount ~/ nestLimit),
              0,
              0,
              255,
            )
          : Colors.white,
      child: nestCount < nestLimit
          ? RecursiveNestContainer(
              nestLimit: nestLimit,
              nestCount: nestCount + 1,
            )
          : null,
    );
  }
}

class HugeColumn extends StatelessWidget {
  HugeColumn({
    required this.childCount,
  });

  final int childCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < childCount; i++)
          Flexible(
            child: Container(
              color: i % 2 == 0
                  ? Color.fromARGB(
                      255 - (255 * i ~/ childCount),
                      0,
                      0,
                      255,
                    )
                  : Colors.white,
            ),
          ),
      ],
    );
  }
}
