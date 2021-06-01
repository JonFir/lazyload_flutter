import 'dart:convert';

import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'city': city,
      'street': street,
      'house': house,
      'flat': flat,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      city: map['city'] as String,
      street: map['street'] as String,
      house: map['house'] as String,
      flat: map['flat'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) => Address.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surname': surname,
      'age': age,
      'addreses': addreses.map((x) => x.toMap()).toList(),
    };
  }

  factory Human.fromMap(Map<String, dynamic> map) {
    return Human(
      name: map['name'] as String,
      surname: map['surname'] as String,
      age: map['age'] as int,
      addreses: List<Address>.from(
        (map['addreses'] as List<dynamic>).map<Address>(
          (dynamic x) => Address.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Human.fromJson(String source) => Human.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

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
