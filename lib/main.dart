import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/todo_bloc.dart';
import 'package:flutter_bloc_app/bloc_observer.dart';
import 'package:flutter_bloc_app/cubit/todo_cubit.dart';
import 'package:flutter_bloc_app/repository/todo_repository.dart';
import 'package:flutter_bloc_app/screen/todo_bloc_screen.dart';

import 'screen/todo_cubit_screen.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: TodoBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => TodoBloc(TodoRepositoryImpl())),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoBlocScreen(),
      ),
    );
  }
}
