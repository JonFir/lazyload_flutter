import 'package:dart_lesson/domain/blocs/users_bloc.dart';
import 'package:dart_lesson/ui/widgets/example_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider<UsersBloc>(
        create: (_) => UsersBloc(),
        child: const ExampleWidget(),
        dispose: (_, bloc) => bloc.close(),
      ),
    );
  }
}
