import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class ExampleWidgetModel extends ChangeNotifier {
  Future<File> getFile() async {
    final directory = await pathProvider.getApplicationDocumentsDirectory();
    final filePath = directory.path + '/my_file';
    final file = File(filePath);
    return file;
  }

  void readFile() async {
    final file = await getFile();
    final isExist = await file.exists();
    if (!isExist) return;
    final result = file.readAsString();
  }

  void createFile() async {
    final file = await getFile();
    await file.writeAsString('Привет Мир!!!');
  }
}

class ExampleWidgetModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;
  const ExampleWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static ExampleWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ExampleWidgetModelProvider>();
  }

  static ExampleWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleWidgetModelProvider>()
        ?.widget;
    return widget is ExampleWidgetModelProvider ? widget : null;
  }
}
