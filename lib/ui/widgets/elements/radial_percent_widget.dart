import 'dart:math';

import 'package:flutter/material.dart';

class RadialPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  RadialPercentWidget({
    Key? key,
    required this.child,
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: _RadialPercentPainter(
            percent: percent,
            fillColor: fillColor,
            lineColor: lineColor,
            freeColor: freeColor,
            lineWidth: lineWidth,
          ),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(lineWidth * 1.5),
            child: child,
          ),
        ),
      ],
    );
  }
}

class _RadialPercentPainter extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;

  _RadialPercentPainter({
    required this.percent,
    required this.fillColor,
    required this.lineColor,
    required this.freeColor,
    required this.lineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = _calculateCirclesRect(size);
    _darwBackground(canvas, rect);
    _darwFreeSpace(canvas, rect);
    _darwFiledSpace(canvas, rect);
  }

  void _darwBackground(Canvas canvas, Rect rect) {
    final paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    canvas.drawOval(rect, paint);
  }

  void _darwFiledSpace(Canvas canvas, Rect rect) {
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    paint.strokeWidth = lineWidth;

    canvas.drawArc(
      rect,
      _radians(-90),
      _radians(360 * percent),
      false,
      paint,
    );
  }

  void _darwFreeSpace(Canvas canvas, Rect rect) {
    final paint = Paint()
      ..color = freeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    canvas.drawArc(
      rect,
      _radians(360 * percent - 90),
      _radians(360 * (1.0 - percent)),
      false,
      paint,
    );
  }

  double _radians(double degrees) {
    return degrees * pi / 180;
  }

  Rect _calculateCirclesRect(Size size) {
    final offset = lineWidth / 2;
    final rect = Offset(offset, offset) &
        Size(size.width - lineWidth, size.height - lineWidth);
    return rect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
