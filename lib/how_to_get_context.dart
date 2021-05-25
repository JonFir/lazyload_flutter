import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);

  static void nextScreen(BuildContext context) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const NextScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => nextScreen(context),
            child: const Text('Переход'),
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(_) {
    return const Scaffold(
      body: SafeArea(
        child: InheritExample(
          child: ColoredWidget(
            initalColor: Colors.red,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: ColoredWidget(
                initalColor: Colors.green,
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: ColorButton(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InheritExample extends InheritedWidget {
  const InheritExample({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class ColoredWidget extends StatefulWidget {
  final Widget child;
  final Color initalColor;

  const ColoredWidget({
    Key? key,
    required this.initalColor,
    required this.child,
  }) : super(key: key);

  @override
  _ColoredWidgetState createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {
  late Color color;

  @override
  void initState() {
    color = widget.initalColor;
    super.initState();
  }

  void chnageColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: widget.child,
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({Key? key}) : super(key: key);

  void _onPressed(BuildContext context) {
    context
        .findAncestorStateOfType<_ColoredWidgetState>()
        ?.chnageColor(Colors.pink);
    context
        .findRootAncestorStateOfType<_ColoredWidgetState>()
        ?.chnageColor(Colors.yellow);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredWidget(
      initalColor: Colors.blue,
      child: Center(
        child: ElevatedButton(
          onPressed: () => _onPressed(context),
          child: const Text('Жми'),
        ),
      ),
    );
  }
}
