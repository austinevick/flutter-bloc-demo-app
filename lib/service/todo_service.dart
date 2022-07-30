import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_app/model/data.dart';

class TodoService {
  static Future<List<Data>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List<dynamic>)
          .map((e) => Data.fromMap(e))
          .toList();
    } else {
      throw Exception('Failed to get data');
    }
  }
}
