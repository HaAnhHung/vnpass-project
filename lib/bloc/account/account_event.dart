import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AccountEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ShowDialogUpdateAvatarEvent extends AccountEvent {
  final BuildContext context;

  ShowDialogUpdateAvatarEvent(this.context);
}

class SendOTPEvent extends AccountEvent {}

class ConfirmOTPEvent extends AccountEvent {}

class ChangePasswordEvent extends AccountEvent {
  final String oldPassword;
  final String newPassword;
  final String confirmNewPassword;

  ChangePasswordEvent(this.oldPassword, this.newPassword, this.confirmNewPassword);
}

class SendOTPToResetPassEvent extends AccountEvent {
  final String phone;

  SendOTPToResetPassEvent(this.phone);
}

class ResetPasswordEvent extends AccountEvent {
  final String phone;
  final String password;
  final String confirmPassword;
  final String otp;

  ResetPasswordEvent(this.phone, this.password, this.otp, this.confirmPassword);
}