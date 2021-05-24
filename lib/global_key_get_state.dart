import 'package:flutter/material.dart';

final key = GlobalKey<_AwesomeTextState>();

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => key.currentState?._increment(),
              child: const Text('Увеличить'),
            ),
            AwesomeText(
              key: key,
            )
          ],
        ),
      ),
    );
  }
}

class AwesomeText extends StatefulWidget {
  AwesomeText({Key? key}) : super(key: key);

  @override
  _AwesomeTextState createState() => _AwesomeTextState();
}

class _AwesomeTextState extends State<AwesomeText> {
  var _value = 0;
  void _increment() {
    _value += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('$_value'),
    );
  }
}
