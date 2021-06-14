import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'example_widget_model.g.dart';

class ExampleWidgetModel {
  Future<Box<User>>? userBox;

  void setup() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    userBox = Hive.openBox<User>('user_box');
    userBox?.then((box) {
      box.listenable().addListener(() {
        print(box.values);
      });
    });
  }

  void doSome() async {
    final box = await userBox;
    final user = User('Ivan', 16);
    await box?.add(user);
  }
}

@HiveType(typeId: 0)
class User extends HiveObject {
  // removed HiveFieldsId: 2

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  User(this.name, this.age);

  @override
  String toString() => 'Name: $name, age: $age';
}
