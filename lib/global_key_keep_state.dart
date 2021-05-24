import 'package:flutter/material.dart';

final key = GlobalKey();

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return Container(
                  color: Colors.green[100],
                  child: Foo(key),
                );
              case 1:
                return Container(
                  color: Colors.blue[100],
                  child: const Text('Blank Page'),
                );
              case 2:
                return Container(
                  color: Colors.red[100],
                  child: Foo(key),
                );
              default:
                throw '404';
            }
          },
        ),
      ),
    );
  }
}

class Foo extends StatefulWidget {
  @override
  _FooState createState() => _FooState();

  Foo(Key? key) : super(key: key);
}

class _FooState extends State<Foo> {
  bool _switchValue = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _switchValue,
          onChanged: (v) {
            setState(() => _switchValue = v);
          },
        ),
        Slider(
          value: _sliderValue,
          onChanged: (v) {
            setState(() => _sliderValue = v);
          },
        )
      ],
    );
  }
}
