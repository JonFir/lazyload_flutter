import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

abstract class MainNavigation {
  Map<String, Widget Function(BuildContext)> makeRoutes();
  Route<Object> onGenerateRoute(RouteSettings settings);
}

class MyApp extends StatelessWidget {
  final mainNavigation = GetIt.instance<MainNavigation>();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: mainNavigation.makeRoutes(),
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
