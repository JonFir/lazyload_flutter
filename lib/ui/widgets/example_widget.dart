import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

const duration = Duration(milliseconds: 500);

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _controller.addListener(() {
      print(_controller.status);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.reverse();
                // if (_controller.isCompleted) {
                //   _controller.reverse();
                // } else {
                //   _controller.forward();
                // }
              });
            },
            child: const Icon(Icons.pause),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                // _controller.animateTo(0.5);
                // _controller.repeat(reverse: true);
                _controller.forward();
              });
            },
            child: const Icon(Icons.play_arrow),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            color: Colors.black,
            child: AnimatedWidgetExample(controller: _controller),
          ),
        ),
      ),
    );
  }
}

class ScaleTransitionExample extends StatelessWidget {
  final AnimationController controller;

  const ScaleTransitionExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.scale(
          scale: controller.value,
          child: child,
        );
      },
      child: Container(
        width: 100,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}

class AnimatedWidgetExample extends AnimatedWidget {
  const AnimatedWidgetExample({required AnimationController controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.scale(
      scale: animation.value,
      child: Container(
        width: 100,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}
