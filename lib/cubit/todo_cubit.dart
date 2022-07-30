import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubit/todo_state.dart';
import 'package:flutter_bloc_app/model/data.dart';
import 'package:flutter_bloc_app/repository/todo_repository.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository repository;
  TodoCubit(this.repository) : super(TodoInitial());

  Future<void> fetchData() async {
    try {
      List<Data> data = await repository.fetchData();
      emit(TodoLoading(data));
    } on SocketException catch (e) {
      emit(TodoError(
          'Unable to connect, please check your internet connection'));
    }
  }
}
