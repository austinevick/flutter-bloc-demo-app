import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_app/model/coin.dart';

@immutable
abstract class CoinEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppStarted extends CoinEvent {}

class RefreshCoins extends CoinEvent {}

class FetchMoreCoins extends CoinEvent {
  final List<Coin> coins;
  FetchMoreCoins(this.coins);
  @override
  List<Object?> get props => [coins];
}
