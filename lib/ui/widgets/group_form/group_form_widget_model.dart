import 'package:dart_lesson/domain/entity/group.dart';
import 'package:dart_lesson/library/hive/box_manager.dart';
import 'package:flutter/material.dart';

class GroupFormWidgetModel extends ChangeNotifier {
  var _groupName = '';
  String? errorText;

  set groupName(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _groupName = value;
  }

  Future<void> saveGroup(BuildContext context) async {
    if (_groupName.trim().isEmpty) {
      errorText = 'Введите название группы';
      notifyListeners();
      return;
    }
    final group = Group(name: _groupName);
    final box = await BoxManager.instance.openGroupBox();
    await box.add(group);
    await BoxManager.instance.closeBox(box);
    Navigator.of(context).pop();
  }
}

class GroupFormWidgetModelProvider extends InheritedNotifier {
  final GroupFormWidgetModel model;
  const GroupFormWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static GroupFormWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupFormWidgetModelProvider>();
  }

  static GroupFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<GroupFormWidgetModelProvider>()
        ?.widget;
    return widget is GroupFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(GroupFormWidgetModelProvider oldWidget) {
    return false;
  }
}
