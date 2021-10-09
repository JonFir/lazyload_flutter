import 'dart:async';

import 'package:dart_lesson/domain/entity/user.dart';

class UserDataProvider {

  Timer? _timer;
  var _user = User(0);
  final _controller = StreamController<User>();
  Stream<User> get userStream => _controller.stream.asBroadcastStream();
  User get user => _user;

  void openConnect() {
    if (_timer != null) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (_){
      _user = User(_user.age + 1);
      _controller.add(_user);
    });
  }

  void closeConnect() {
    _timer?.cancel();
    _timer = null;
  }

}
