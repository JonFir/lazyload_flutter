import 'package:dart_lesson/domain/entity/group.dart';
import 'package:dart_lesson/domain/entity/task.dart';
import 'package:dart_lesson/library/hive/box_manager.dart';
import 'package:dart_lesson/ui/navigation/main_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TasksWidgetModel extends ChangeNotifier {
  int groupKey;
  late final Future<Box<Task>> _box;
  ValueListenable<Object>? _lisableBox;
  var _tasks = <Task>[];

  List<Task> get tasks => _tasks.toList();

  Group? _group;
  Group? get group => _group;

  TasksWidgetModel({required this.groupKey}) {
    _setup();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.tasksForm,
      arguments: groupKey,
    );
  }

  Future<void> deleteTask(int taskIndex) async {
    return (await _box).deleteAt(taskIndex);
  }

  Future<void> doneToggle(int taskIndex) async {
    final box = await _box;
    final task = box.getAt(taskIndex);
    task?.isDone = !task.isDone;
    await task?.save();
  }

  Future<void> _readTasksFromHive() async {
    _tasks = (await _box).values.toList();
    notifyListeners();
  }

  Future<void> _setup() async {
    _box = BoxManager.instance.openTaskBox(groupKey);
    await _readTasksFromHive();
    _lisableBox = (await _box).listenable();
    _lisableBox?.addListener(_readTasksFromHive);
  }

  @override
  void dispose() async {
    _lisableBox?.removeListener(_readTasksFromHive);
    await BoxManager.instance.closeBox((await _box));

    super.dispose();
  }
}

class TasksWidgetModelProvider extends InheritedNotifier {
  final TasksWidgetModel model;
  const TasksWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static TasksWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TasksWidgetModelProvider>();
  }

  static TasksWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TasksWidgetModelProvider>()
        ?.widget;
    return widget is TasksWidgetModelProvider ? widget : null;
  }
}
