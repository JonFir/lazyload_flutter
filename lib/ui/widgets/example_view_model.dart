import 'package:dart_lesson/ui/widgets/calculator_service.dart';
import 'package:dart_lesson/ui/widgets/example_widget.dart';

class ExampleCalcViewModel implements ExampleViewModel {
  final CalculatorService calculatorService;
  const ExampleCalcViewModel(this.calculatorService);

  @override
  void onPressMe() {
    final result = calculatorService.calculate(
      1,
      2,
      CalculatorServiceOperation.summ,
    );
    print(result);
  }

  @override
  void onPressMe2() {
    print("5");
  }
}

class ExamplePetViewModel implements ExampleViewModel {
  const ExamplePetViewModel();

  @override
  void onPressMe() {
    print("гав гав");
  }

  @override
  void onPressMe2() {
    print("мяу мяу");
  }
}
