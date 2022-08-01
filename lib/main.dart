import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/coin_bloc.dart';
import 'package:flutter_bloc_app/bloc_observer.dart';
import 'package:flutter_bloc_app/repository/coin_repository.dart';
import 'package:flutter_bloc_app/screen/coin_bloc_screen.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: TodoBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => CoinBloc(CoinRepositoryImpl())),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CoinBlocScreen(),
      ),
    );
  }
}
