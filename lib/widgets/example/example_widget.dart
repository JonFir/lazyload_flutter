import 'package:dart_lesson/widgets/example/example_widget_model.dart';
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
          child: ExampleWidgetModelProvider(
            model: _model,
            child: Column(
              children: [
                const _CreateFileButton(),
                const _ReadFileButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateFileButton extends StatelessWidget {
  const _CreateFileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ExampleWidgetModelProvider.read(context)!.model.createFile,
      child: const Text('Создать файл'),
    );
  }
}

class _ReadFileButton extends StatelessWidget {
  const _ReadFileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ExampleWidgetModelProvider.read(context)!.model.readFile,
      child: const Text('Прочитать файл'),
    );
  }
}
