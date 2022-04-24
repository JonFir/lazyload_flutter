import 'dart:math';
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("second");
        },
        child: const Icon(Icons.next_plan),
      ),
      backgroundColor: Colors.red,
      body: Align(
        alignment: Alignment.topLeft,
        child: Hero(
          tag: "some",
          // flightShuttleBuilder: (
          //   BuildContext flightContext,
          //   Animation<double> animation,
          //   HeroFlightDirection flightDirection,
          //   BuildContext fromHeroContext,
          //   BuildContext toHeroContext,
          // ) {
          //   return RotationTransition(
          //     turns: animation,
          //     child: toHeroContext.widget,
          //   );
          // },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class ExampleWidget2 extends StatelessWidget {
  const ExampleWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.next_plan),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      backgroundColor: Colors.green,
      body: Align(
        alignment: Alignment.bottomRight,
        child: Hero(
          tag: "some",
          createRectTween: _createRectTween,
          // placeholderBuilder: (context, size, child) {
          //   return Opacity(opacity: 0.2, child: child);
          // },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class QuadraticRectTween extends RectTween {
  QuadraticRectTween({
    Rect? begin,
    Rect? end,
  }) : super(begin: begin, end: end);

  bool _dirty = true;

  void _initialize() {
    assert(begin != null);
    assert(end != null);
    _centerArc = QuadraticOffsetTween(
      begin: begin!.center,
      end: end!.center,
    );
    _dirty = false;
  }

  QuadraticOffsetTween? get centerArc {
    if (begin == null || end == null) return null;
    if (_dirty) _initialize();
    return _centerArc;
  }

  late QuadraticOffsetTween _centerArc;

  @override
  set begin(Rect? value) {
    if (value != begin) {
      super.begin = value;
      _dirty = true;
    }
  }

  @override
  set end(Rect? value) {
    if (value != end) {
      super.end = value;
      _dirty = true;
    }
  }

  @override
  Rect lerp(double t) {
    if (_dirty) _initialize();
    if (t == 0.0) return begin!;
    if (t == 1.0) return end!;
    final Offset center = _centerArc.lerp(t);
    final double width = lerpDouble(begin!.width, end!.width, t)!;
    final double height = lerpDouble(begin!.height, end!.height, t)!;
    return Rect.fromLTWH(
        center.dx - width / 2.0, center.dy - height / 2.0, width, height);
  }
}

RectTween _createRectTween(Rect? begin, Rect? end) {
  return QuadraticRectTween(begin: begin, end: end);
}

class QuadraticOffsetTween extends Tween<Offset> {
  QuadraticOffsetTween({
    required Offset begin,
    required Offset end,
  }) : super(begin: begin, end: end);

  @override
  Offset lerp(double t) {
    final begin = this.begin ?? Offset.zero;
    final end = this.end ?? Offset.zero;
    if (t == 0.0) return begin;
    if (t == 1.0) return end;
    final double x =
        -11 * begin.dx * pow(t, 2) + (end.dx + 10 * begin.dx) * t + begin.dx;
    final double y =
        -2 * begin.dy * pow(t, 2) + (end.dy + 1 * begin.dy) * t + begin.dy;
    return Offset(x, y);
  }
}
