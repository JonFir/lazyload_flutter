import 'dart:async';

import 'package:dart_lesson/domain/data_providers/user_data_provider.dart';
import 'package:dart_lesson/domain/entity/user.dart';

class UsersState {
  final User currentUser;

//<editor-fold desc="Data Methods">

  const UsersState({
    required this.currentUser,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersState &&
          runtimeType == other.runtimeType &&
          currentUser == other.currentUser);

  @override
  int get hashCode => currentUser.hashCode;

  @override
  String toString() {
    return 'UsersState{ currentUser: $currentUser }';
  }

  UsersState copyWith({
    User? currentUser,
  }) {
    return UsersState(
      currentUser: currentUser ?? this.currentUser,
    );
  }

//</editor-fold>
}

class UsersBloc {
  final _userDataProvider = UserDataProvider();
  var _state = UsersState(
    currentUser: User(0),
  );

  final _stateController = StreamController<UsersState>.broadcast();

  UsersState get state => _state;
  Stream<UsersState> get stream => _stateController.stream;

  UsersBloc() {
    _initialize();
  }

  void updateState(UsersState state) {
    if (_state == state) return;
    _state = state;
    _stateController.add(state);
  }

  Future<void> _initialize() async {
    final user = await _userDataProvider.loadValue();
    updateState(_state.copyWith(currentUser: user));
  }

  void incrementAge() {
    var user = _state.currentUser;
    user = user.copyWith(age: user.age + 1);
    updateState(_state.copyWith(currentUser: user));
    _userDataProvider.saveValue(user);
  }

  void decrementAge() {
    var user = _state.currentUser;
    user = user.copyWith(age: user.age - 1);
    updateState(_state.copyWith(currentUser: user));
    _userDataProvider.saveValue(user);
  }
}
