import 'package:family_tree_test/models/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class GraphRepository {
  late Isar isar;
  static var json = {
    "nodeDataArray": [
      {
        "key": 1,
        "name": "Stella Payne Diaz",
        "title": "CEO",
        "dept": "Management",
        "pic": "1.jpg",
        "email": "sdiaz@example.com",
        "phone": "(234) 555-6789",
      },
      {
        "key": 2,
        "name": "Luke Warm",
        "title": "VP Marketing/Sales",
        "dept": "Management",
        "pic": "2.jpg",
        "email": "lwarm@example.com",
        "phone": "(234) 555-6789",
        "parent": 1
      },
      {
        "key": 3,
        "name": "Meg Meehan Hoffa",
        "title": "Sales",
        "dept": "Sales",
        "pic": "3.jpg",
        "email": "mhoffa@example.com",
        "phone": "(234) 555-6789",
        "parent": 2
      },
      {
        "key": 4,
        "name": "Peggy Flaming",
        "title": "VP Engineering",
        "dept": "Management",
        "pic": "4.jpg",
        "email": "pflaming@example.com",
        "phone": "(234) 555-6789",
        "parent": 1
      },
      {
        "key": 5,
        "name": "Saul Wellingood",
        "title": "Manufacturing",
        "dept": "Production",
        "pic": "5.jpg",
        "email": "swellingood@example.com",
        "phone": "(234) 555-6789",
        "parent": 4
      },
      {
        "key": 6,
        "name": "Al Ligori",
        "title": "Marketing",
        "dept": "Marketing",
        "pic": "6.jpg",
        "email": "aligori@example.com",
        "phone": "(234) 555-6789",
        "parent": 2
      },
      {
        "key": 7,
        "name": "Dot Stubadd",
        "title": "Sales Rep",
        "dept": "Sales",
        "pic": "7.jpg",
        "email": "dstubadd@example.com",
        "phone": "(234) 555-6789",
        "parent": 3
      },
      {
        "key": 8,
        "name": "Les Ismore",
        "title": "Project Mgr",
        "dept": "Production",
        "pic": "8.jpg",
        "email": "lismore@example.com",
        "phone": "(234) 555-6789",
        "parent": 5
      },
      {
        "key": 9,
        "name": "April Lynn Parris",
        "title": "Events Mgr",
        "dept": "Marketing",
        "pic": "9.jpg",
        "email": "aparris@example.com",
        "phone": "(234) 555-6789",
        "parent": 6
      },
      {
        "key": 10,
        "name": "Xavier Breath",
        "title": "Engineering",
        "dept": "Engineering",
        "pic": "10.jpg",
        "email": "xbreath@example.com",
        "phone": "(234) 555-6789",
        "parent": 4
      },
      {
        "key": 11,
        "name": "Anita Hammer",
        "title": "Process",
        "dept": "Production",
        "pic": "11.jpg",
        "email": "ahammer@example.com",
        "phone": "(234) 555-6789",
        "parent": 5
      },
      {
        "key": 12,
        "name": "Billy Aiken",
        "title": "Software",
        "dept": "Engineering",
        "pic": "12.jpg",
        "email": "baiken@example.com",
        "phone": "(234) 555-6789",
        "parent": 10
      },
      {
        "key": 13,
        "name": "Stan Wellback",
        "title": "Testing",
        "dept": "Engineering",
        "pic": "13.jpg",
        "email": "swellback@example.com",
        "phone": "(234) 555-6789",
        "parent": 10
      },
      {
        "key": 14,
        "name": "Marge Innovera",
        "title": "Hardware",
        "dept": "Engineering",
        "pic": "14.jpg",
        "email": "minnovera@example.com",
        "phone": "(234) 555-6789",
        "parent": 10
      },
      {
        "key": 15,
        "name": "Evan Elpus",
        "title": "Quality",
        "dept": "Production",
        "pic": "15.jpg",
        "email": "eelpus@example.com",
        "phone": "(234) 555-6789",
        "parent": 5
      },
      {
        "key": 16,
        "name": "Lotta B. Essen",
        "title": "Sales Rep",
        "dept": "Sales",
        "pic": "16.jpg",
        "email": "lessen@example.com",
        "phone": "(234) 555-6789",
        "parent": 3
      }
    ]
  };
  Future<void> initIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open([PersonSchema], directory: dir.path);
    }
  }

  Future<void> writeListToIsar() async {
    var listNodeJson = json['nodeDataArray'];
    final listNode = listNodeJson!.map((node) => Person.fromMap(node)).toList();
    await isar.writeTxn(() async {
      for (var e in listNode) {
        await isar.persons.put(e);
      }
    });
  }

  Future<List<Person>> fetchDataFromIsar() async {
    await initIsar();
    await writeListToIsar();
    List<Person> persons = await isar.persons.where().findAll();
    debugPrint('Persons: ${persons.length}');
    return persons;
  }

  Future<void> addNodeToIsar({required Person person}) async {
    await isar.writeTxn(() async {
      await isar.persons.put(person);
    });
  }
}
