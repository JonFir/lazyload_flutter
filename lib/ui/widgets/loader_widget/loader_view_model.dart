import 'package:dart_lesson/ui/navigation/main_navigation_route_names.dart';

import 'package:flutter/material.dart';

abstract class LoaderViewModelAuthStatusProvider {
  Future<bool> isAuth();
}

class LoaderViewModel {
  final BuildContext context;
  final LoaderViewModelAuthStatusProvider authStatusProvider;

  LoaderViewModel({
    required this.context,
    required this.authStatusProvider,
  }) {
    asyncInit();
  }

  Future<void> asyncInit() async {
    await checkAuth();
  }

  Future<void> checkAuth() async {
    final isAuth = await authStatusProvider.isAuth();
    final nextScreen = isAuth
        ? MainNavigationRouteNames.mainScreen
        : MainNavigationRouteNames.auth;
    Navigator.of(context).pushReplacementNamed(nextScreen);
  }
}
