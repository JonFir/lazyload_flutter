import 'dart:math';

import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("second");
        },
        child: const Icon(Icons.next_plan),
      ),
      backgroundColor: Colors.red,
      body: Align(
        alignment: Alignment.topLeft,
        child: Hero(
          tag: "some",
          child: SizedBox(
            width: 100,
            height: 100,
            child: Some(),
          ),
        ),
      ),
    );
  }
}

class ExampleWidget2 extends StatelessWidget {
  const ExampleWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final side = 2.0 * (100 / sqrt2);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.next_plan),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      backgroundColor: Colors.green,
      body: Align(
        alignment: Alignment.bottomRight,
        child: Hero(
          tag: "some",
          child: SizedBox(
            width: sideSize(100),
            height: sideSize(100),
            child: Some(),
          ),
        ),
      ),
    );
  }
}

double sideSize(int fromSize) => 2.0 * (fromSize / sqrt2);

class Some extends StatelessWidget {
  const Some({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}
