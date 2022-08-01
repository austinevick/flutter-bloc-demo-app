import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/coin_state.dart';
import 'package:flutter_bloc_app/model/coin.dart';
import 'package:flutter_bloc_app/repository/coin_repository.dart';

class CoinCubit extends Cubit<CoinState> {
  final CoinRepository repository;
  CoinCubit(this.repository) : super(CoinInitial());

  Future<void> fetchData() async {
    try {
      List<Coin> data = await repository.fetchData();
      emit(CoinLoading(data));
    } on SocketException catch (e) {
      emit(CoinError(
          'Unable to connect, please check your internet connection'));
    }
  }
}
