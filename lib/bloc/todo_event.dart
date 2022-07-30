import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TodoFetched extends TodoEvent {}
