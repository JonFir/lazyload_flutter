import 'package:dart_lesson/ui/navigation/main_navigation_route_names.dart';
import 'package:flutter/widgets.dart';

class MainNavigationAction {
  const MainNavigationAction();

  void resetNavigation(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      MainNavigationRouteNames.loaderWidget,
      (route) => false,
    );
  }
}
