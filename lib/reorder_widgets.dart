import 'package:flutter/material.dart';

class Example extends StatefulWidget {
  Example({Key? key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  var ints = List<String>.generate(10, (index) => index.toString());
  void _onReorder(int from, int to) {
    setState(() {
      if (from < to) {
        to -= 1;
      }
      final element = ints.removeAt(from);
      ints.insert(to, element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView.builder(
          itemCount: ints.length,
          itemBuilder: (BuildContext context, int index) {
            return GreenBox(
              ValueKey(ints[index]),
            );
          },
          onReorder: _onReorder,
        ),
      ),
    );
  }
}

class GreenBox extends StatefulWidget {
  GreenBox(Key? key) : super(key: key);

  @override
  _GreenBoxState createState() => _GreenBoxState();
}

class _GreenBoxState extends State<GreenBox> {
  var _text = 'start';

  void _changeText(String text) {
    _text = text;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.green,
        child: Column(
          children: [
            Text(_text),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: _changeText,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
