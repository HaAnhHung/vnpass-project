import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:vnpass/bloc/auth/auth_bloc.dart';
import 'package:vnpass/bloc/auth/auth_event.dart';
import 'package:vnpass/bloc/auth/auth_state.dart';
import 'package:vnpass/routes.dart';
import 'package:vnpass/theme/colors.dart';
import 'package:vnpass/widget/dialog.dart';
import 'package:vnpass/widget/loading.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTPPageState();

}

class _OTPPageState extends State<OTPPage>{
  AuthBloc authBloc = AuthBloc();
  TextEditingController otpCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ActivateSuccessState) {
          Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
        } else if (state is ActivateFailState){
          // Fluttertoast.showToast(msg: state.message, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
          if (authBloc.countConfirmOTP <= 5){
            dialog(context, "Thông báo", state.message, (){
              otpCtrl.clear();
              Navigator.pop(context);
            }, "Thử lại");
          } else {
            dialog(context, "Thông báo", state.message, (){
              otpCtrl.clear();
              authBloc.add(ResendOTPEvent());
            }, "Gửi lại OTP");
          }
          // authBloc.emit(AuthInitialState());
        } else if (state is ResendOTPSuccessState) {
          Navigator.pop(context);
        } else if (state is ResendOTPFailState) {
          Navigator.pop(context);
          dialog(context, "Thông báo", state.message, (){
            otpCtrl.clear();
            authBloc.add(ResendOTPEvent());
          }, "Gửi lại OTP");
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: AppTheme.black,
        appBar: AppBar(
          backgroundColor: AppTheme.black,
          // iconTheme: IconThemeData(color: AppTheme.white, size: 20),
          // title: Text("OTP", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),),
        ),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 64,),
                  GestureDetector(
                      onTap: () {

                      },
                      child: Text(
                        "Kích hoạt tài khoản",
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
                      style: TextStyle(
                          color: AppTheme.white, fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 50,),
                  Pinput(
                    length: 6,
                    controller: otpCtrl,
                    defaultPinTheme: PinTheme(
                        height: 50,
                        textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),
                        width: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.grey2)
                        )
                    ),
                    focusedPinTheme: PinTheme(
                        height: 50,
                        textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),
                        width: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.greenApp2)
                        )
                    ),
                    submittedPinTheme: PinTheme(
                        height: 50,
                        textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),
                        width: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppTheme.greenApp2)
                        )
                    ),
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
                      authBloc.add(ActivateEvent(otpCtrl.text));
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
                              "Tiếp tục",
                              style: TextStyle(
                                color: AppTheme.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 10,),
                            if (state is ActivatingState)
                              SizedBox(
                                  child: const Loading(),
                                height: 16,
                                width: 16,
                              )
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