import 'package:dart_lesson/main.dart';
import 'package:dart_lesson/main_navigation.dart';
import 'package:dart_lesson/ui/widgets/calculator_service.dart';
import 'package:dart_lesson/ui/widgets/example_view_model.dart';
import 'package:dart_lesson/ui/widgets/example_widget.dart';
import 'package:dart_lesson/ui/widgets/my_app.dart';
import 'package:dart_lesson/ui/widgets/summator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setupGetIt() {
  GetIt.instance.registerSingletonAsync<SharedPreferences>(
    SharedPreferences.getInstance,
  );
  GetIt.instance.registerSingletonWithDependencies<ScreenFactory>(
    () => ScreenFactoryDefault(),
    dependsOn: [SharedPreferences],
  );
  GetIt.instance.registerSingletonWithDependencies<MainNavigation>(
    () => MainNavigationDefault(),
    dependsOn: [ScreenFactory],
  );

  GetIt.instance.registerFactory<Summator>(() => const Summator());
  GetIt.instance.registerFactory<AppFactory>(() => const AppFactoryDefault());
  GetIt.instance.registerFactory<CalculatorService>(() => CalculatorService());
  GetIt.instance.registerFactory<ExampleViewModel>(
    () => ExampleCalcViewModel(),
  );
}

class ScreenFactoryDefault implements ScreenFactory {
  ScreenFactoryDefault() {
    setup();
  }

  Future<void> setup() async {
    final storage = GetIt.instance<SharedPreferences>();
    storage.setBool("key", true);
  }

  @override
  Widget makeExampleScreen() => const ExampleWidget();
}

class AppFactoryDefault implements AppFactory {
  const AppFactoryDefault();

  @override
  Widget makeApp() => MyApp();
}
