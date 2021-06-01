import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'example.g.dart';

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: JsonExampleProvider(
          coder: JsonExampleCoder(),
          child: const ButtonWidget(),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.encode(),
            child: const Text('Кодировать'),
          ),
          ElevatedButton(
            onPressed: () => JsonExampleProvider.read(context)?.coder.decode(),
            child: const Text('Декодировать'),
          ),
        ],
      ),
    );
  }
}

class JsonExampleProvider extends InheritedWidget {
  final JsonExampleCoder coder;
  const JsonExampleProvider({
    Key? key,
    required this.coder,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static JsonExampleProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  static JsonExampleProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<JsonExampleProvider>()
        ?.widget;
    return widget is JsonExampleProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(JsonExampleProvider oldWidget) {
    return true;
  }
}

class JsonExampleCoder {
  final humans = [
    Human(
      name: 'Иван',
      surname: 'Иванов',
      age: 17,
      addreses: [
        Address(city: 'Москва', street: 'Баумана', house: '12а', flat: 12),
        Address(city: 'Новосибирск', street: 'Батурина', house: '1', flat: 1),
        Address(city: 'Питер', street: 'Моховая', house: '198г', flat: 561),
      ],
    ),
    Human(
      name: 'Петр',
      surname: 'Петров',
      age: 17,
      addreses: [
        Address(city: 'Москва', street: 'Мира', house: '54', flat: 67),
        Address(city: 'Казань', street: 'Ленина', house: '23', flat: 56),
        Address(city: 'Пенза', street: 'Карла Маркса', house: '13б', flat: 12),
      ],
    ),
  ];

  final jsonString = '''
  [
    {
        "name": "Иван",
        "surname": "Иванов",
        "age": 17,
        "addreses": [
            {
                "city": "Москва",
                "street": "Баумана",
                "house": "12а",
                "flat": 12
            },
            {
                "city": "Новосибирск",
                "street": "Батурина",
                "house": "1",
                "flat": 1
            },
            {
                "city": "Питер",
                "street": "Моховая",
                "house": "198г",
                "flat": 561
            }
        ]
    },
    {
        "name": "Петр",
        "surname": "Петров",
        "age": 17,
        "addreses": [
            {
                "city": "Москва",
                "street": "Мира",
                "house": "54",
                "flat": 67
            },
            {
                "city": "Казань",
                "street": "Ленина",
                "house": "23",
                "flat": 56
            },
            {
                "city": "Пенза",
                "street": "Карла Маркса",
                "house": "13б",
                "flat": 12
            }
        ]
    }
  ]
  ''';

  void encode() {
    final jsonStrng = jsonEncode(humans.map((e) => e.toJson()).toList());
    print(jsonStrng);
  }

  void decode() {
    final json = jsonDecode(jsonString) as List<dynamic>;
    final users = json
        .map<Human>((dynamic e) => Human.fromJson(e as Map<String, dynamic>))
        .toList();
    print(users);
  }
}

@JsonSerializable()
class Human {
  String name;
  String surname;
  int age;
  List<Address> addreses;

  Human({
    required this.name,
    required this.surname,
    required this.age,
    required this.addreses,
  });

  factory Human.fromJson(Map<String, dynamic> json) => _$HumanFromJson(json);

  Map<String, dynamic> toJson() => _$HumanToJson(this);
}

@JsonSerializable()
class Address {
  final String city;
  final String street;
  final String house;
  final int flat;

  Address({
    required this.city,
    required this.street,
    required this.house,
    required this.flat,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
