import 'dart:convert';

class Dog {
  final int id;
  final String name;
  final int age;

  Dog({
    this.id,
    this.name,
    this.age,
  });

    // Convert a Dog into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toJsonWith()  => {
      'id': id,
      'name': name,
      'age': age,
  };

  Dog.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      age = json['age'];

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}