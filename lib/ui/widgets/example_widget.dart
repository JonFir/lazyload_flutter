import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // AnimatedDefaultTextStyleExample(toggle: toggle),
                // AnimatedAlignExample(toggle: toggle),
                // AnimatedCrossFadeExample(toggle: toggle),
                // AnimatedOpacityExample(toggle: toggle),
                // AnimatedPaddingExample(toggle: toggle),
                // AnimatedRotationExample(toggle: toggle),
                // AnimatedSwitcherExample(toggle: toggle),
                AnimatedSizeExample(toggle: toggle),
                // AnimatedContainerExample(toggle: toggle),
                // ContainerExample(toggle: toggle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// AnimatedDefaultTextStyle

class AnimatedDefaultTextStyleExample extends StatelessWidget {
  final bool toggle;
  const AnimatedDefaultTextStyleExample({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  static const styleOne = TextStyle(fontSize: 30, color: Colors.red);
  static const styleTwo = TextStyle(fontSize: 13, color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: duration,
      style: toggle ? styleOne : styleTwo,
      child: const Text("Hello world"),
    );
  }
}

//AnimatedAlign

class AnimatedAlignExample extends StatelessWidget {
  final bool toggle;
  const AnimatedAlignExample({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AnimatedAlign(
        duration: duration,
        alignment: toggle ? Alignment.topLeft : Alignment.bottomRight,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.red,
        ),
      ),
    );
  }
}

//AnimatedCrossFade

class AnimatedCrossFadeExample extends StatelessWidget {
  final bool toggle;
  const AnimatedCrossFadeExample({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: duration,
      crossFadeState:
          toggle ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
      secondChild: Container(
        width: 150,
        height: 150,
        color: Colors.green,
      ),
    );
  }
}

//AnimatedOpacity

class AnimatedOpacityExample extends StatelessWidget {
  final bool toggle;
  const AnimatedOpacityExample({Key? key, required this.toggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: duration,
      opacity: toggle ? 1 : 0.5,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}

// AnimatedPadding

class AnimatedPaddingExample extends StatelessWidget {
  final bool toggle;
  const AnimatedPaddingExample({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: duration,
      padding: toggle ? EdgeInsets.zero : const EdgeInsets.all(50),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}

// AnimatedRotation

class AnimatedRotationExample extends StatelessWidget {
  final bool toggle;
  const AnimatedRotationExample({Key? key, required this.toggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      duration: duration,
      turns: toggle ? pi : pi / 2,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}

//AnimatedSwitcher

class AnimatedSwitcherExample extends StatelessWidget {
  final bool toggle;
  const AnimatedSwitcherExample({Key? key, required this.toggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      child: toggle
          ? Container(
              key: const ValueKey(0),
              width: 50,
              height: 50,
              color: Colors.red,
            )
          : Container(
              key: const ValueKey(1),
              width: 150,
              height: 150,
              color: Colors.blue,
            ),
      transitionBuilder: (child, animation) => SizeTransition(
        child: child,
        sizeFactor: animation,
      ),
    );
  }
}

// AnimatedSize

class AnimatedSizeExample extends StatelessWidget {
  final bool toggle;
  const AnimatedSizeExample({Key? key, required this.toggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration,
      alignment: Alignment.topRight,
      child: Container(
        width: toggle ? 150 : 50,
        height: toggle ? 150 : 50,
        color: Colors.blue,
      ),
      curve: Curves.slowMiddle,
    );
  }
}

// AnimatedContainer

class AnimatedContainerExample extends StatelessWidget {
  final bool toggle;
  const AnimatedContainerExample({Key? key, required this.toggle})
      : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return AnimatedContainer(
  //     duration: duration,
  //     color: Colors.red,
  //     padding: const EdgeInsets.all(40),
  //     child: Container(
  //       width: toggle ? 150 : 50,
  //       height: toggle ? 150 : 50,
  //       color: Colors.blue,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      color: toggle ? Colors.red : Colors.green,
      padding: toggle ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
      width: toggle ? 100 : 400,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.blue,
      ),
    );
  }
}

class ContainerExample extends StatelessWidget {
  final bool toggle;
  const ContainerExample({
    Key? key,
    required this.toggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: toggle ? Colors.red : Colors.green,
      padding: toggle ? const EdgeInsets.all(40) : const EdgeInsets.all(80),
      width: toggle ? 100 : 400,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.blue,
      ),
    );
  }
}
