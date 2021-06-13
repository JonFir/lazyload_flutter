import 'package:hive/hive.dart';

part 'example_widget_model.g.dart';

class ExampleWidgetModel {
  void doSome() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(PetAdapter());
    }
    var box = await Hive.openBox<User>('testBox');
    var petBox = await Hive.openBox<Pet>('petBox');
    
    final user = box.get('user');
    final pet = user?.pets?[0];
    print(pet);
    await box.compact();
    await box.close();
  }
}

@HiveType(typeId: 0)
class User extends HiveObject {
  // removed HiveFieldsId: 2

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(3)
  HiveList<Pet>? pets;

  User(this.name, this.age, this.pets);

  @override
  String toString() => 'Name: $name, age: $age';
}

@HiveType(typeId: 1)
class Pet extends HiveObject {
  // removed HiveFieldsId:

  @HiveField(0)
  String name;

  Pet(this.name);

  @override
  String toString() => 'Name: $name';
}
