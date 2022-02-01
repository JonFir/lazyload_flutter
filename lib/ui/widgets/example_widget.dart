import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class ExampleViewModel {
  void onPressMe();
  void onPressMe2();
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ExampleViewModel>();
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
