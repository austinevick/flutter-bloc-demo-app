import 'package:flutter_bloc_app/model/data.dart';
import 'package:flutter_bloc_app/service/todo_service.dart';

abstract class TodoRepository {
  Future<List<Data>> fetchData();
}

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<List<Data>> fetchData() {
    return TodoService.fetchData();
  }
}
