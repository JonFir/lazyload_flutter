import 'package:dart_lesson/ui/widgets/summator.dart';

enum CalculatorServiceOperation { summ }

class CalculatorService {
  final summator = const Summator();

  const CalculatorService();
  int calculate(int a, int b, CalculatorServiceOperation operation) {
    if (operation == CalculatorServiceOperation.summ) {
      return summator.summ(a, b);
    } else {
      return 0;
    }
  }
}
