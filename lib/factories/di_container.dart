import 'package:dart_lesson/main.dart';
import 'package:dart_lesson/main_navigation.dart';
import 'package:dart_lesson/ui/widgets/calculator_service.dart';
import 'package:dart_lesson/ui/widgets/example_view_model.dart';
import 'package:dart_lesson/ui/widgets/example_widget.dart';
import 'package:dart_lesson/ui/widgets/my_app.dart';
import 'package:dart_lesson/ui/widgets/summator.dart';
import 'package:flutter/material.dart';

MainDIContainer makeDIContainer() => _DIContainer();

class _DIContainer implements MainDIContainer, ScreenFactory {
  late final MainNavigation _mainNavigation;

  Summator _makeSummator() => const Summator();

  CalculatorService _makeCalculatorService() => CalculatorService(
        _makeSummator(),
      );

  ExampleViewModel _makeExampleViewModel() => ExampleCalcViewModel(
        _makeCalculatorService(),
      );

  @override
  Widget makeExampleScreen() => ExampleWidget(
        model: _makeExampleViewModel(),
      );

  @override
  Widget makeApp() => MyApp(mainNavigation: _mainNavigation);

  _DIContainer() {
    _mainNavigation = MainNavigationDefault(this);
  }
}
