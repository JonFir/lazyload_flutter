import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Complex {
  var valueOne = 0;
  var valueTwo = 0;
}

class Model extends ChangeNotifier {
  var one = 0;
  var two = 0;
  final complex = Complex();

  void inc1() {
    one += 1;
    notifyListeners();
  }

  void inc2() {
    two += 2;
    notifyListeners();
  }

  void incComplex1() {
    complex.valueOne += 1;
    notifyListeners();
  }

  void incComplex2() {
    complex.valueTwo += 1;
    notifyListeners();
  }
}

class ForExample extends ChangeNotifier {
  var one = 0;
  void inc1() {
    one += 1;
    notifyListeners();
  }
}

class Wrapper {
  final Model model;
  final ForExample forExample;

  Wrapper(this.model, this.forExample);
}

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Model()),
          ChangeNotifierProvider(create: (_) => ForExample()),
          ProxyProvider2(
            update: (
              BuildContext context,
              Model model,
              ForExample forExmaple,
              prev,
            ) {
              return Wrapper(model, forExmaple);
            },
          ),
        ],
        child: const _View(),
      );
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.read<Model>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: state.inc1,
              child: const Text('one'),
            ),
            ElevatedButton(
              onPressed: state.inc2,
              child: const Text('two'),
            ),
            ElevatedButton(
              onPressed: state.incComplex1,
              child: const Text('complex1'),
            ),
            ElevatedButton(
              onPressed: state.incComplex2,
              child: const Text('complex2'),
            ),
            const _OneWidget(),
            const _TwoWidget(),
            const _ThreeWidget(),
            const _FourWidget(),
            Selector<Model, int>(
              builder: (context, value, _) {
                return Text('$value');
              },
              selector: (_, model) => model.one,
              shouldRebuild: (prev, current) => current - prev > 1,
            ),
            Consumer2<Model, ForExample>(
              builder: (context, model, forExample, child) {
                return Text('${model.one}');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _OneWidget extends StatelessWidget {
  const _OneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.select((Model value) => value.one);
    return Text("$value");
  }
}

class _TwoWidget extends StatelessWidget {
  const _TwoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.select((Model value) => value.two);
    return Text("$value");
  }
}

class _ThreeWidget extends StatelessWidget {
  const _ThreeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.select((Model value) => value.complex.valueOne);
    return Text("$value");
  }
}

class _FourWidget extends StatelessWidget {
  const _FourWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.select((Model value) => value.complex.valueTwo);
    return Text("$value");
  }
}
