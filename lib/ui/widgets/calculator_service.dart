import 'package:dart_lesson/factories/di_container.dart';

enum CalculatorServiceOperation { summ }

class CalculatorService {
  final summator = ServiceLocator.instace.makeSummator();

  CalculatorService();

  int calculate(int a, int b, CalculatorServiceOperation operation) {
    if (operation == CalculatorServiceOperation.summ) {
      return summator.summ(a, b);
    } else {
      return 0;
    }
  }
}
