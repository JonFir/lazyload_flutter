import 'package:bloc/bloc.dart';
import 'package:dart_lesson/domain/blocs/blocs_observer.dart';
import 'package:dart_lesson/ui/widgets/my_app.dart';
import 'package:flutter/widgets.dart';

void main() {
  const app = MyApp();
  Bloc.observer = BlocsObserver();
  runApp(app);
}
