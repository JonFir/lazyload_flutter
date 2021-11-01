import 'dart:async';

import 'package:bloc/bloc.dart';
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

class UsersCubit extends Cubit<UsersState> {
  final _userDataProvider = UserDataProvider();

  UsersCubit() : super(UsersState(currentUser: User(0))) {
    _initialize();
  }

  Future<void> _initialize() async {
    final user = await _userDataProvider.loadValue();
    final newState = state.copyWith(currentUser: user);
    emit(newState);
  }

  void incrementAge() {
    var user = state.currentUser;
    user = user.copyWith(age: user.age + 1);
    emit(state.copyWith(currentUser: user));
    _userDataProvider.saveValue(user);
  }

  void decrementAge() {
    var user = state.currentUser;
    user = user.copyWith(age: user.age - 1);
    emit(state.copyWith(currentUser: user));
    _userDataProvider.saveValue(user);
  }
}
