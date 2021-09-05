import 'package:dart_lesson/domain/services/auth_service.dart';
import 'package:dart_lesson/domain/services/user_service.dart';
import 'package:dart_lesson/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _ViewModelState {
  final String ageTitle;
  _ViewModelState({
    required this.ageTitle,
  });
}

class _ViewModel extends ChangeNotifier {
  final _authService = AuthService();
  final _userService = UserService();

  var _state = _ViewModelState(ageTitle: '');
  _ViewModelState get state => _state;

  void loadValue() async {
    await _userService.initilalize();
    _updateState();
  }

  _ViewModel() {
    loadValue();
  }

  Future<void> onIncrementButtonPressed() async {
    _userService.incrementAge();
    _updateState();
  }

  Future<void> onDecrementButtonPressed() async {
    _userService.decrementAge();
    _updateState();
  }

  Future<void> onLogoutPressed(BuildContext context) async {
    await _authService.logout();
    MainNavigation.showLoader(context);
  }

  void _updateState() {
    final user = _userService.user;

    _state = _ViewModelState(
      ageTitle: user.age.toString(),
    );
    notifyListeners();
  }
}

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => _ViewModel(),
      child: const ExampleWidget(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<_ViewModel>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () => viewModel.onLogoutPressed(context),
            child: const Text('Выход'),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _AgeTitle(),
              _AgeIncrementWidget(),
              _AgeDecrementWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgeTitle extends StatelessWidget {
  const _AgeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.select((_ViewModel vm) => vm.state.ageTitle);
    return Text(title);
  }
}

class _AgeIncrementWidget extends StatelessWidget {
  const _AgeIncrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<_ViewModel>();
    return ElevatedButton(
      onPressed: viewModel.onIncrementButtonPressed,
      child: const Text('+'),
    );
  }
}

class _AgeDecrementWidget extends StatelessWidget {
  const _AgeDecrementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<_ViewModel>();
    return ElevatedButton(
      onPressed: viewModel.onDecrementButtonPressed,
      child: const Text('-'),
    );
  }
}
