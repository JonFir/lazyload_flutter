import 'package:flutter/material.dart';

abstract class ExampleViewModel {
  void onPressMe();
  void onPressMe2();
}

class ExampleWidget extends StatelessWidget {
  final ExampleViewModel model;

  const ExampleWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: model.onPressMe,
                child: const Text("Жми меня"),
              ),
              ElevatedButton(
                onPressed: model.onPressMe2,
                child: const Text("Жми меня 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
