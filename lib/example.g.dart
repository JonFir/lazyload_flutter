// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Human _$HumanFromJson(Map<String, dynamic> json) {
  return Human(
    name: json['name'] as String,
    surname: json['surname'] as String,
    age: json['age'] as int,
    addreses: (json['addreses'] as List<dynamic>)
        .map((e) => Address.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HumanToJson(Human instance) => <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'age': instance.age,
      'addreses': instance.addreses,
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    city: json['city'] as String,
    street: json['street'] as String,
    house: json['house'] as String,
    flat: json['flat'] as int,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'city': instance.city,
      'street': instance.street,
      'house': instance.house,
      'flat': instance.flat,
    };
