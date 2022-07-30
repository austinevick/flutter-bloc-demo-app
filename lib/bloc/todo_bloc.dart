import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/todo_event.dart';
import 'package:flutter_bloc_app/cubit/todo_state.dart';
import 'package:flutter_bloc_app/model/data.dart';
import 'package:flutter_bloc_app/repository/todo_repository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository repository;
  TodoBloc(this.repository) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      try {
        List<Data> data = await repository.fetchData();
        emit(TodoLoading(data));
      } on SocketException catch (e) {
        emit(TodoError("Couldn't fetch the list, please try again later!"));
      }
    });
  }
}
