import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_app/model/coin.dart';

@immutable
abstract class CoinState extends Equatable {
  @override
  List<Object> get props => [];
}

class CoinInitial extends CoinState {}

class CoinLoading extends CoinState {
  final List<Coin> data;
  CoinLoading(this.data);
}

class CoinError extends CoinState {
  final String message;
  CoinError(this.message);
}
