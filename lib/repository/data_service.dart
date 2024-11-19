import 'dart:convert';

import 'package:family_tree_test/models/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const _baseUrl = '';

class PersonRequestFailed implements Exception {}

class DataService {
  Future<List<Person>> getPersons() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      throw PersonRequestFailed();
    }
    debugPrint('200');
    final responseJson = jsonDecode(response.body) as Map;
    if (!responseJson.containsKey('nodeDataArray')) {
      throw PersonRequestFailed();
    }
    return responseJson['nodeDataArray'];
  }
}
