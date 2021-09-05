import 'package:dart_lesson/ui/widgets/auth_widget.dart';
import 'package:dart_lesson/ui/widgets/example_widget.dart';
import 'package:dart_lesson/ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == 'auth') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
                AuthWidget.create(),
            transitionDuration: Duration.zero,
          );
        } else if (settings.name == 'example') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
                ExampleWidget.create(),
            transitionDuration: Duration.zero,
          );
        } else if (settings.name == 'loader') {
          return PageRouteBuilder<dynamic>(
            pageBuilder: (context, animation1, animation2) =>
                LoaderWidget.create(),
            transitionDuration: Duration.zero,
          );
        }
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoaderWidget.create(),
    );
  }
}
