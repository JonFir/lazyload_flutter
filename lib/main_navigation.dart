import 'package:dart_lesson/ui/widgets/my_app.dart';
import 'package:flutter/material.dart';

abstract class MainNavigationRouteNames {
  static const example = '/';
}

abstract class ScreenFactory {
  Widget makeExampleScreen();
}

class MainNavigationDefault implements MainNavigation {
  final ScreenFactory screenFactory;

  MainNavigationDefault(this.screenFactory);

  @override
  Map<String, Widget Function(BuildContext)> makeRoutes() =>
      <String, Widget Function(BuildContext)>{
        MainNavigationRouteNames.example: (_) =>
            screenFactory.makeExampleScreen(),
      };

  @override
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        const widget = Text('Navigation error!!!');
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
