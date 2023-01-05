import 'package:equatable/equatable.dart';

abstract class CardState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CardInitialState extends CardState {}

class LockCardSuccessState extends CardState {}

class LockCardSFailState extends CardState {}