import 'package:dart_lesson/Library/Widgets/Inherited/provider.dart';
import 'package:dart_lesson/ui/widgets/app/my_app.dart';
import 'package:dart_lesson/ui/widgets/app/my_app_model.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  const app = MyApp();
  final widget = Provider(model: model, child: app);
  runApp(widget);
}
