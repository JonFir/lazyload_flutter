import 'package:dart_lesson/ui/widgets/summator.dart';
import 'package:get_it/get_it.dart';

enum CalculatorServiceOperation { summ }

class CalculatorService {
  final summator = GetIt.instance<Summator>();

  CalculatorService();

  int calculate(int a, int b, CalculatorServiceOperation operation) {
    if (operation == CalculatorServiceOperation.summ) {
      return summator.summ(a, b);
    } else {
      return 0;
    }
  }
}
