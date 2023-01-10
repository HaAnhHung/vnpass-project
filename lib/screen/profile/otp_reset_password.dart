import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:vnpass/bloc/account/account_bloc.dart';
import 'package:vnpass/bloc/account/account_event.dart';
import 'package:vnpass/bloc/account/account_state.dart';
import 'package:vnpass/routes.dart';
import 'package:vnpass/theme/colors.dart';
import 'package:vnpass/widget/loading.dart';

class OTPResetPassPage extends StatefulWidget {
  const OTPResetPassPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTPResetPassPageState();
}

class _OTPResetPassPageState extends State<OTPResetPassPage> {
  TextEditingController otpCtrl = TextEditingController();
  AccountBloc accountBloc = AccountBloc();

  @override
  void initState() {
    super.initState();
    accountBloc = BlocProvider.of<AccountBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        backgroundColor: AppTheme.black,
        appBar: AppBar(
          backgroundColor: AppTheme.black,
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Đặt lại mật khẩu",
                        style: TextStyle(
                          color: AppTheme.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      "Nhập mã OTP vừa được gửi về\nsố điện thoại của bạn\n(Mã OTP có thời hạn 5 phút)",
                      style: TextStyle(color: AppTheme.white, fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Pinput(
                    length: 6,
                    controller: otpCtrl,
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
            Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 16.0 + MediaQuery.of(context).padding.bottom,
                left: 0,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.newPassword);
                      // accountBloc.add();
                      // authBloc.add(ActivateEvent(otpCtrl.text));
                    },
                    child: Container(
                        alignment: Alignment.center,
                        color: AppTheme.greenApp2,
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Xác nhận",
                              style: TextStyle(
                                color: AppTheme.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (state is SendingOTPTOResetPassState)
                              const SizedBox(
                                width: 10,
                              ),
                            if (state is SendingOTPTOResetPassState)
                              const SizedBox(
                                height: 15,
                                width: 15,
                                child: Loading(),
                              )
                            // if (state is ActivatingState)
                            //   SizedBox(
                            //     child: const Loading(),
                            //     height: 16,
                            //     width: 16,
                            //   )
                            // isCheckPhoneLoading
                            //     ? Container(
                            //   margin:
                            //   const EdgeInsets.only(left: 12),
                            //   child: SizedBox(
                            //     child: CircularProgressIndicator(
                            //         color: AppTheme.white,
                            //         strokeWidth: 3),
                            //     height: 16.0,
                            //     width: 16.0,
                            //   ),
                            // )
                            //     : Container(),
                          ],
                        )))),
          ],
        ),
      ),
    );
  }
}
