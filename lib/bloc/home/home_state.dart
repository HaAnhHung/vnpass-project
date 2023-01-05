import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {

}

class GotoProfilePageState extends HomeState {}

class GotoCardPageState extends HomeState {}