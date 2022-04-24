import 'package:dart_lesson/ui/widgets/example_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => const ExampleWidget(),
      },
      onGenerateRoute: (_) {
        return PageRouteBuilder<Object>(
          transitionDuration: Duration(seconds: 4),
          pageBuilder: (_, __, ___) => ExampleWidget2(),
        );
      },
      // home: const ExampleWidget(),
    );
  }
}
