import 'package:isar/isar.dart';

part 'person.g.dart';

@collection
class Person {
  Id key;
  final String name;
  final String title;
  final String dept;
  final String pic;
  final String email;
  final String phone;
  final int? parent;

  Person(
      {this.key = Isar.autoIncrement,
      required this.name,
      required this.title,
      required this.dept,
      required this.pic,
      required this.email,
      required this.phone,
      required this.parent});
  @override
  String toString() {
    return 'MyNode{ key: $key, name: $name, title: $title, dept: $dept, pic: $pic,'
        ' email: $email, phone: $phone, parent: $parent,}';
  }

  Person copyWith({
    int? key,
    String? name,
    String? title,
    String? dept,
    String? pic,
    String? email,
    String? phone,
    int? parent,
  }) {
    return Person(
      key: key ?? this.key,
      name: name ?? this.name,
      title: title ?? this.title,
      dept: dept ?? this.dept,
      pic: pic ?? this.pic,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      parent: parent ?? this.parent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'name': name,
      'title': title,
      'dept': dept,
      'pic': pic,
      'email': email,
      'phone': phone,
      'parent': parent,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      key: map['key'] as int,
      name: map['name'] as String,
      title: map['title'] as String,
      dept: map['dept'] as String,
      pic: map['pic'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      parent: map['parent'] != null ? map['parent'] as int : null,
    );
  }
}
