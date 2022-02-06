import 'package:dart_lesson/ui/widgets/example_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class ExampleViewModel {
  void onPressMe();
  void onPressMe2();
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = GetIt.instance<ExampleViewModel>();
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
              ElevatedButton(
                onPressed: () {
                  GetIt.instance.unregister<ExampleViewModel>();
                  GetIt.instance.registerFactory<ExampleViewModel>(
                    () => const ExamplePetViewModel(),
                  );
                },
                child: const Text("Жми меня 3"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
