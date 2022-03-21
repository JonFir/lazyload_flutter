import 'package:flutter/material.dart';

const duration = Duration(milliseconds: 250);

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  var toggle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            toggle = !toggle;
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            color: Colors.black,
            child: TweenAnimationBuilderExample(toggle: toggle),
          ),
        ),
      ),
    );
  }
}

class TweenAnimationBuilderExample extends StatelessWidget {
  final bool toggle;
  static final _forwardTween = ColorTween(
    begin: Colors.white,
    end: Colors.red,
  );
  static final _reverseTween = ReverseTween(_forwardTween);

  const TweenAnimationBuilderExample({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: toggle ? _forwardTween : _reverseTween,
      duration: duration,
      builder: (BuildContext context, Color? color, Widget? child) {
        return ColorFiltered(
          child: child,
          colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
        );
      },
      child: Image.asset('images/sun.jpg'),
    );
  }
}

class TweenAnimationBuilderSecondExample extends StatelessWidget {
  final bool toggle;
  static final _forwardTween = Tween(
    begin: 0.0,
    end: 1.0,
  );
  static final _reverseTween = ReverseTween(_forwardTween);

  const TweenAnimationBuilderSecondExample({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: toggle ? _forwardTween : _reverseTween,
      duration: duration,
      builder: (BuildContext context, double value, Widget? child) {
        return Opacity(
          opacity: value,
          child: SizedBox(
            width: 200 * value,
            height: 200 * value,
            child: child,
          ),
        );
      },
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
