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

abstract class UsersEvents {}

class UsersIncrementEvent implements UsersEvents {}

class UsersDecrementEvent implements UsersEvents {}

class UsersInitializeEvent implements UsersEvents {}

class UsersBloc extends Bloc<UsersEvents, UsersState> {
  final _userDataProvider = UserDataProvider();

  UsersBloc() : super(UsersState(currentUser: User(0))) {
    add(UsersInitializeEvent());
  }

  @override
  Stream<UsersState> mapEventToState(UsersEvents event) async* {
    if (event is UsersInitializeEvent) {
      final user = await _userDataProvider.loadValue();
      yield UsersState(currentUser: user);
    } else if (event is UsersIncrementEvent) {
      var user = state.currentUser;
      user = user.copyWith(age: user.age + 1);
      await _userDataProvider.saveValue(user);
      yield UsersState(currentUser: user);
    } else if (event is UsersDecrementEvent) {
      var user = state.currentUser;
      user = user.copyWith(age: user.age - 1);
      await _userDataProvider.saveValue(user);
      yield UsersState(currentUser: user);
    }
  }
}
