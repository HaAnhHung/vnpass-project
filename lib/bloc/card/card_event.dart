import 'package:equatable/equatable.dart';

abstract class CardEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LockCardEvent extends CardEvent {}