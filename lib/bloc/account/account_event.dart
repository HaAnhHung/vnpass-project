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

class CheckOldPassEvent extends AccountEvent {}

class ConfirmNewPassEvent extends AccountEvent {
  final String newPass;
  final String confirmPass;

  ConfirmNewPassEvent(this.newPass, this.confirmPass);
}