import 'package:equatable/equatable.dart';

abstract class WalletEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetWalletEvent extends WalletEvent {
  final String token;

  GetWalletEvent(this.token);
}

class SetWalletPassEvent extends WalletEvent {
  final String token;
  final String accountPassword;
  final String walletPassword;

  SetWalletPassEvent(this.token, this.accountPassword, this.walletPassword);
}