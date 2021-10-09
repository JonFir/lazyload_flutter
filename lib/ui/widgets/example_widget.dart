import 'dart:async';

import 'package:dart_lesson/domain/entity/user.dart';
import 'package:dart_lesson/domain/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModelState {
  final String ageTitle;
  ViewModelState({
    required this.ageTitle,
  });
}

class ViewModel extends ChangeNotifier {
  final _userService = UserService();

  var _state = ViewModelState(ageTitle: '');
  ViewModelState get state => _state;
  StreamSubscription<User>? userSubscription;

  ViewModel() {
    _state = ViewModelState(
      ageTitle: _userService.user.age.toString()
    );
    userSubscription = _userService.userStream.listen((user) {
      _state = ViewModelState(
          ageTitle: _userService.user.age.toString()
      );
      notifyListeners();
    });
    _userService.openConnect();
  }

  @override
  void dispose() {
    userSubscription?.cancel();
    _userService.closeConnect();
    super.dispose();
  }

}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: _AgeTitle(),
        ),
      ),
    );
  }
}

class _AgeTitle extends StatelessWidget {
  const _AgeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.select((ViewModel vm) => vm.state.ageTitle);
    return Text(title);
  }
}