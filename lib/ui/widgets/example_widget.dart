import 'package:flutter/material.dart';

const duration = Duration(milliseconds: 4000);

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.forward();
          });
        },
        child: const Icon(Icons.play_arrow),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            color: Colors.black,
            child: ScaleTransitionExample(controller: _controller),
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
        return CustomPaint(
          painter: MyIconPainter(controller),
          size: const Size(300, 300),
        );
      },
    );
  }
}

class MyIconPainter extends CustomPainter {
  final AnimationController controller;

  late final Animation<double> dotGrow;
  late final Animation<double> lineGrow;
  late final Animation<double> linesMove;

  MyIconPainter(this.controller) {
    dotGrow = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
    );
    lineGrow = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.3, 0.55, curve: Curves.easeIn),
      ),
    );
    linesMove = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.6, 1.0, curve: Curves.bounceOut),
      ),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final dotPainter = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.0;

    final linesPainter = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 40.0;

    canvas.drawCircle(
      Offset(centerX, centerY),
      20.0 * dotGrow.value,
      dotPainter,
    );

    if (dotGrow.value < 1.0) return;
    canvas.drawLine(
      Offset(
        centerX - centerX * linesMove.value,
        centerY - centerY * lineGrow.value,
      ),
      Offset(
        centerX + centerX * linesMove.value,
        centerY + centerY * lineGrow.value,
      ),
      linesPainter,
    );
    canvas.drawLine(
      Offset(
        centerX + centerX * linesMove.value,
        centerY - centerY * lineGrow.value,
      ),
      Offset(
        centerX - centerX * linesMove.value,
        centerY + centerY * lineGrow.value,
      ),
      linesPainter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
