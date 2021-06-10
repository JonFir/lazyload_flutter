import 'package:dart_lesson/widgets/example/example_model.dart';
import 'package:flutter/material.dart';

class ExampleWidget extends StatefulWidget {
  ExampleWidget({Key? key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  final _model = ExampleWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _model.setName,
                child: const Text('Сохранить имя'),
              ),
              ElevatedButton(
                onPressed: _model.readName,
                child: const Text('Прочитать имя'),
              ),
              ElevatedButton(
                onPressed: _model.setToken,
                child: const Text('Сохранить токен'),
              ),
              ElevatedButton(
                onPressed: _model.readToken,
                child: const Text('Прочитать токен'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
