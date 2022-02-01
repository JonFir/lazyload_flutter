import 'package:dart_lesson/main_navigation.dart';
import 'package:dart_lesson/ui/widgets/calculator_service.dart';
import 'package:dart_lesson/ui/widgets/example_view_model.dart';
import 'package:dart_lesson/ui/widgets/example_widget.dart';
import 'package:dart_lesson/ui/widgets/my_app.dart';
import 'package:dart_lesson/ui/widgets/summator.dart';
import 'package:flutter/material.dart';

class ServiceLocator {
  static final instace = ServiceLocator._();
  ServiceLocator._();

  final MainNavigation mainNavigation = MainNavigationDefault();

  Summator makeSummator() => const Summator();

  CalculatorService makeCalculatorService() => CalculatorService();

  ExampleViewModel makeExampleViewModel() => ExampleCalcViewModel();

  Widget makeExampleScreen() => ExampleWidget();

  Widget makeApp() => MyApp();
}
