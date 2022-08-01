import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/coin_event.dart';
import 'package:flutter_bloc_app/bloc/coin_state.dart';
import 'package:flutter_bloc_app/model/coin.dart';
import 'package:flutter_bloc_app/repository/coin_repository.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  final CoinRepository repository;
  CoinBloc(this.repository) : super(CoinInitial()) {
    on<CoinEvent>((event, emit) async {
      try {
        List<Coin> data = await repository.fetchData();
        emit(CoinLoading(data));
      } on SocketException catch (e) {
        emit(CoinError("Couldn't fetch the list, please try again later!"));
      }
    });

    on<CoinEvent>((event, emit) => null);
  }
}
