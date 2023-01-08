import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// sign up
class SignupEvent extends AuthEvent {}

class SignupSuccessEvent extends AuthEvent {}

class SigningUpEvent extends AuthEvent {}

class SignupFailEvent extends AuthEvent {
  final String message;

  SignupFailEvent(this.message);
}


// login
class LoginEvent extends AuthEvent {

}

class LoggingInEvent extends AuthEvent {}

class LoginSuccessEvent extends AuthEvent {}

class LoginFailEvent extends AuthEvent {}

class ActivateEvent extends AuthEvent {
  final String otp;

  ActivateEvent(this.otp);
}

class ResendOTPEvent extends AuthEvent {}