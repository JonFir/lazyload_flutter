import 'package:dart_lesson/address.dart';
import 'package:dart_lesson/human.dart';

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

const jsonString = '''
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
