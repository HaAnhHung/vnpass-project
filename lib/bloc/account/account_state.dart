import 'package:equatable/equatable.dart';

abstract class AccountState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AccountInitialState extends AccountState {}

class ChooseImageSuccessState extends AccountState {}

class SendOTPSuccessState extends AccountState {}

class ConfirmOTPSuccessState extends AccountState {}

class CheckOldPassSuccessState extends AccountState {}

class ConfirmNewPassSuccessState extends AccountState {}

class ConfirmNewPassFailState extends AccountState {}