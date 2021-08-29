class User {
  final int age;

  User(this.age);

  User copyWith({
    int? age,
  }) {
    return User(
      age ?? this.age,
    );
  }
}