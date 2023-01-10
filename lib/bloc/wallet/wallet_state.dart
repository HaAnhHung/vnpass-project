import 'package:equatable/equatable.dart';

abstract class WalletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WalletInitialState extends WalletState {}

// get wallet
class GetWalletSuccessState extends WalletState {}

class GetWalletSFailState extends WalletState {
  final String message;

  GetWalletSFailState(this.message);
}

class SetWalletPassState extends WalletState {}

// set wallet password
class SetWalletPassSuccessState extends WalletState {}

class SetWalletPassFailState extends WalletState {
  final String message;

  SetWalletPassFailState(this.message);
}

class SettingWalletPassState extends WalletState {}