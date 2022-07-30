import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_app/model/data.dart';

@immutable
abstract class TodoState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {
  final List<Data> data;
  TodoLoading(this.data);
}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
}
