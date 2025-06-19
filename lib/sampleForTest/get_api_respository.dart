

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testapp/sampleForTest/user_model.dart';

class UserRepository {

  final http.Client client;
  UserRepository(this.client);
  
  Future<List<UserModel>> getUserData() async {

    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      
      final List<dynamic> temp = jsonDecode(response.body);
      return temp.map((e) => UserModel.fromJson(e)).toList();
    }
    throw Exception('Some Error Occurred');
  }
}