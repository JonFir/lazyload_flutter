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
