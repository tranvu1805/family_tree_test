import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/user.dart';

class AuthRepository {
  Future<String> logIn(
      {required String username, required String password}) async {
    var response = await http.post(
      Uri.parse('https'),
      headers: {},
      body: {"username": username, "password": password},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<String> signIn({required User user}) async {
    var response = await http.post(
      Uri.parse('https'),
      headers: {},
      body: {"username": user.username, "password": user.password},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<String> checkToken({required User user}) async {
    var response = await http.post(
      Uri.parse('https'),
      headers: {},
      body: {"username": user.username, "password": user.password},
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to login');
    }
  }
}
