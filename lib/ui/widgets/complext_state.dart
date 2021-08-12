import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  _Controller createState() => _Controller();
}

class Complex {
  final int valueOne;
  final int valueTwo;
  Complex({
    required this.valueOne,
    required this.valueTwo,
  });

  Complex copyWith({
    int? valueOne,
    int? valueTwo,
  }) {
    return Complex(
      valueOne: valueOne ?? this.valueOne,
      valueTwo: valueTwo ?? this.valueTwo,
    );
  }

  @override
  String toString() => 'Complex(valueOne: $valueOne, valueTwo: $valueTwo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Complex &&
        other.valueOne == valueOne &&
        other.valueTwo == valueTwo;
  }

  @override
  int get hashCode => valueOne.hashCode ^ valueTwo.hashCode;
}

class _State {
  final int one;
  final int two;
  final Complex complex;
  _State({
    required this.one,
    required this.two,
    required this.complex,
  });

  _State copyWith({
    int? one,
    int? two,
    Complex? complex,
  }) {
    return _State(
      one: one ?? this.one,
      two: two ?? this.two,
      complex: complex ?? this.complex,
    );
  }

  @override
  String toString() => '_State(one: $one, two: $two, complex: $complex)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _State &&
        other.one == one &&
        other.two == two &&
        other.complex == complex;
  }

  @override
  int get hashCode => one.hashCode ^ two.hashCode ^ complex.hashCode;
}

class _Controller extends State<ExampleWidget> {
  var _state = _State(
    one: 0,
    two: 0,
    complex: Complex(
      valueOne: 0,
      valueTwo: 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: _state),
        Provider.value(value: this),
      ],
      child: const _View(),
    );
  }

  void inc1() {
    _state = _state.copyWith(one: _state.one + 1);
    setState(() {});
  }

  void inc2() {
    _state = _state.copyWith(two: _state.two + 1);
    setState(() {});
  }

  void complex() {
    final complex = _state.complex.copyWith(
      valueOne: _state.complex.valueOne + 1,
    );
    _state = _state.copyWith(complex: complex);
    setState(() {});
  }
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.read<_Controller>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: controller.inc1,
              child: const Text('one'),
            ),
            ElevatedButton(
              onPressed: controller.inc2,
              child: const Text('two'),
            ),
            ElevatedButton(
              onPressed: controller.complex,
              child: const Text('complex'),
            ),
            const _OneWidget(),
            const _TwoWidget(),
            const _ThreeWidget(),
            const _FourWidget(),
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
    final value = context.select((_State state) => state.one);
    return Text("$value");
  }
}

class _TwoWidget extends StatelessWidget {
  const _TwoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.select((_State state) => state.two);
    return Text("$value");
  }
}

class _ThreeWidget extends StatelessWidget {
  const _ThreeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.select((_State state) => state.complex.valueOne);
    return Text("$value");
  }
}

class _FourWidget extends StatelessWidget {
  const _FourWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.select((_State state) => state.complex.valueOne);
    return Text("$value");
  }
}
