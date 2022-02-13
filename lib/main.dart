import 'package:dart_lesson/di/di_container.dart';
import 'package:flutter/material.dart';

abstract class AppFactory {
  Widget makeApp();
}

final appFactory = makeAppFactory();

void main() {
  final app = appFactory.makeApp();
  runApp(app);
}
