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

// change password
class ChangingPassState extends AccountState {}

class ChangePassSuccessState extends AccountState {}

class ChangePassFailState extends AccountState {
  final String message;

  ChangePassFailState(this.message);
}

// reset password
class SendOTPTOResetPassSuccessState extends AccountState {}

class SendingOTPTOResetPassState extends AccountState {}

class SendOTPTOResetPassFailState extends AccountState {
  final String message;

  SendOTPTOResetPassFailState(this.message);
}

class ResetPasswordSuccessState extends AccountState {}

class ResetPasswordFailState extends AccountState {
  final String message;

  ResetPasswordFailState(this.message);
}

class ResettingPasswordState extends AccountState {}