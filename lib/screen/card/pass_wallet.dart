import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:vnpass/bloc/auth/auth_bloc.dart';
import 'package:vnpass/bloc/wallet/wallet_bloc.dart';
import 'package:vnpass/bloc/wallet/wallet_event.dart';
import 'package:vnpass/bloc/wallet/wallet_state.dart';
import 'package:vnpass/routes.dart';
import 'package:vnpass/theme/colors.dart';
import 'package:vnpass/widget/dialog.dart';
import 'package:vnpass/widget/loading.dart';

class WalletPassPage extends StatefulWidget {
  const WalletPassPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WalletPassPageState();

}

class _WalletPassPageState extends State<WalletPassPage>{
  WalletBloc walletBloc = WalletBloc();
  AuthBloc authBloc = AuthBloc();
  TextEditingController passWalletCtrl = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    walletBloc = BlocProvider.of<WalletBloc>(context);
    authBloc = BlocProvider.of<AuthBloc>(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletBloc, WalletState>(
      listener: (context, state) {
        if (state is SetWalletPassSuccessState) {
          Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
        } else if (state is SetWalletPassFailState) {
          dialog(context, "Thông báo", state.message, () {
            Navigator.pop(context);
          }, "Xác nhận");
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: AppTheme.black,
        appBar: AppBar(backgroundColor: AppTheme.black,),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 64,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Mật khẩu ví",
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Bạn cần thiết lập mật khẩu ví để có thể sử dụng",
                        style: TextStyle(color: AppTheme.white, fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Pinput(
                      length: 6,
                      controller: passWalletCtrl,
                      defaultPinTheme: PinTheme(
                          height: 50,
                          textStyle: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),
                          width: 40,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppTheme.grey2))),
                      focusedPinTheme: PinTheme(
                          height: 50,
                          textStyle: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),
                          width: 40,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppTheme.greenApp2))),
                      submittedPinTheme: PinTheme(
                          height: 50,
                          textStyle: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),
                          width: 40,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppTheme.greenApp2))),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).padding.bottom + 20,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    walletBloc.add(SetWalletPassEvent(authBloc.token ?? "", authBloc.password, passWalletCtrl.text));
                  },
                  style: ElevatedButton.styleFrom(primary: AppTheme.greenApp2, padding: const EdgeInsets.symmetric(vertical: 15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Xác nhận", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                      if (state is SettingWalletPassState)
                        const SizedBox(width: 10,),
                      if (state is SettingWalletPassState)
                        const SizedBox(height: 15, width: 15, child: Loading(),)
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}