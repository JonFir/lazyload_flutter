import 'package:dart_lesson/ui/widgets/example_view_model.dart';
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
      home: const ExampleWidget(model: ExamplePetViewModel()),
    );
  }
}
