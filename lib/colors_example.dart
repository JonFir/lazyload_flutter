import 'dart:math';

import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: PositionedTiles(),
      ),
    );
  }
}

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    StatelessColorfulTile(),
    StatelessColorfulTile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: swapTiles, child: const Text('Toggle')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ],
    );
  }

  void swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorfulTile extends StatelessWidget {
  final myColor = UniqueColorGenerator.getColor();

  StatelessColorfulTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: myColor,
    );
  }
}

class UniqueColorGenerator {
  static final _random = Random();
  static Color getColor() {
    return Color.fromRGBO(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      1.0,
    );
  }
}
