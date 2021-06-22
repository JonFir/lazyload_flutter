import 'package:dart_lesson/ui/widgets/group_form/group_form_widget.dart';
import 'package:dart_lesson/ui/widgets/groups/goups_widget.dart';
import 'package:dart_lesson/ui/widgets/task_form/task_form_widget.dart';
import 'package:dart_lesson/ui/widgets/tasks/tasks_widget.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteNames {
  static const groups = 'groups';
  static const groupsFrom = 'groups/form';
  static const tasks = 'groups/tasks';
  static const tasksForm = 'groups/tasks/form';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.groups;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.groups: (context) => const GroupsWidget(),
    MainNavigationRouteNames.groupsFrom: (context) => const GroupFormWidget(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRouteNames.tasks:
        final groupKey = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => TasksWidget(groupKey: groupKey),
        );
      case MainNavigationRouteNames.tasksForm:
        final groupKey = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) {
            return TaskFormWidget(groupKey: groupKey);
          },
        );
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (context) => widget);
    }
  }

  MainNavigation();
}
