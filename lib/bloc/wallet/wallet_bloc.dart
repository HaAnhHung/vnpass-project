import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpass/api/get_wallet.dart';
import 'package:vnpass/api/set_wallet_password.dart';
import 'package:vnpass/bloc/wallet/wallet_event.dart';
import 'package:vnpass/bloc/wallet/wallet_state.dart';
import 'package:vnpass/model/wallet.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  Wallet? wallet;
  WalletBloc() : super(WalletInitialState()){
    on<GetWalletEvent>((event, emit) {
      getWalletInfo(event.token);
    });
    on<SetWalletPassEvent>((event, emit) {
      setPasswordForYourWallet(event.token, event.accountPassword, event.walletPassword);
    });
  }

  void getWalletInfo(String token) async {
    var data = await getWallet(token);
    if (data.success && data.code.contains("SUCCESS")) {
      wallet = Wallet.fromJson(data.data['wallet']);
      if (wallet!.needPassword) {
        emit(SetWalletPassState());
      } else {
        emit(GetWalletSuccessState());
      }
    } else {
      emit(GetWalletSFailState(data.message ?? ""));
    }
  }

  void setPasswordForYourWallet(String token, String accountPassword, String walletPassword) async {
    emit(SettingWalletPassState());
    var data = await setWalletPassword(token, accountPassword, walletPassword);
    if (data.success && data.code.contains("SUCCESS")){
      print("36 --- ${data.data}");
      emit(SetWalletPassSuccessState());
    } else {
      emit(SetWalletPassFailState(data.message ?? ""));
    }
  }

}