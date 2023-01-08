import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}


// sign up
class SignupSuccessState extends AuthState {}

class SignupFailState extends AuthState {
  final String message;

  SignupFailState(this.message);
}

class SigningUpState extends AuthState {}

// login
class LoginSuccessState extends AuthState {}

class LoginFailState extends AuthState {
  final String mesage;

  LoginFailState(this.mesage);
}

class LoggingInState extends AuthState {}

class ActivateState extends AuthState {}

class ActivateSuccessState extends AuthState {}

class ActivateFailState extends AuthState {
  final String message;

  ActivateFailState(this.message);
}

class ActivatingState extends AuthState {}

class ResendOTPSuccessState extends AuthState {}

class ResendOTPFailState extends AuthState {
  final String message;

  ResendOTPFailState(this.message);
}

class ResendingOTPState extends AuthState {}