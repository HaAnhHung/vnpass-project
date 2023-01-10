import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vnpass/bloc/account/account_bloc.dart';
import 'package:vnpass/bloc/account/account_event.dart';
import 'package:vnpass/bloc/account/account_state.dart';
import 'package:vnpass/routes.dart';
import 'package:vnpass/theme/colors.dart';
import 'package:vnpass/widget/dialog.dart';
import 'package:vnpass/widget/loading.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewPasswordPageState();

}

class _NewPasswordPageState extends State<NewPasswordPage>{
  AccountBloc accountBloc = AccountBloc();
  TextEditingController newPassCtrl = TextEditingController();
  TextEditingController confirmNewPassCtrl = TextEditingController();
  FocusNode newPassFocusNode = FocusNode();
  FocusNode confirmNewPassFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    accountBloc = BlocProvider.of<AccountBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
          Fluttertoast.showToast(msg: "Đổi mật khẩu thành công", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
        } else if (state is ResetPasswordFailState) {
          dialog(context, "Thất bại", state.message, () {
            Navigator.pop(context);
          }, "Xác nhận");
        }
      },
      builder: (context, state) => GestureDetector(
        onTap: () {
          newPassFocusNode.unfocus();
        },
        child: Scaffold(
          backgroundColor: AppTheme.black,
          appBar: AppBar(
            backgroundColor: AppTheme.black,
          ),
          body: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 44),
                child: Column(
                  children: [
                    Text(
                      "Quên mật khẩu",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500, color: AppTheme.white),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Text(
                        "Nhập số điện thoại đăng nhập\nmã OTP sẽ được gửi về số điện thoại này",
                        style: TextStyle(color: AppTheme.white, fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                              BorderSide(color: Color.fromRGBO(84, 84, 88, 0.85), width: 0.33),
                              top: BorderSide(
                                  color: Color.fromRGBO(84, 84, 88, 0.85), width: 0.33))),
                      height: 56,
                      padding: const EdgeInsets.only(right: 24, left: 24),
                      child: Row(
                        children: [
                          Flexible(
                              child: TextField(
                                controller: newPassCtrl,
                                focusNode: newPassFocusNode,
                                onChanged: (text) {

                                },
                                obscureText: true,
                                autocorrect: false,
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.white,
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(fontSize: 20.0, color: AppTheme.white),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mật khẩu mới",
                                    hintStyle: TextStyle(
                                        fontSize: 20.0, color: Color.fromRGBO(235, 235, 245, 0.3))),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                              BorderSide(color: Color.fromRGBO(84, 84, 88, 0.85), width: 0.33),
                              top: BorderSide(
                                  color: Color.fromRGBO(84, 84, 88, 0.85), width: 0.33))),
                      height: 56,
                      padding: const EdgeInsets.only(right: 24, left: 24),
                      child: Row(
                        children: [
                          Flexible(
                              child: TextField(
                                controller: confirmNewPassCtrl,
                                focusNode: confirmNewPassFocusNode,
                                onChanged: (text) {

                                },
                                obscureText: true,
                                autocorrect: false,
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.white,
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(fontSize: 20.0, color: AppTheme.white),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nhập lại mật khẩu mới",
                                    hintStyle: TextStyle(
                                        fontSize: 20.0, color: Color.fromRGBO(235, 235, 245, 0.3))),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).padding.bottom + 20,
                left: 20,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    accountBloc.add(ResetPasswordEvent(accountBloc.phoneResetPassword, newPassCtrl.text, accountBloc.otpResetPassword, confirmNewPassCtrl.text));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppTheme.greenApp2,
                      padding: const EdgeInsets.symmetric(vertical: 15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Xác nhận",
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                      ),
                      if (state is ResettingPasswordState)
                        const SizedBox(
                          width: 10,
                        ),
                      if (state is ResettingPasswordState)
                        const SizedBox(
                          height: 15,
                          width: 15,
                          child: Loading(),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}