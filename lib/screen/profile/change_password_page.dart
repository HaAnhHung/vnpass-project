import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpass/bloc/account/account_bloc.dart';
import 'package:vnpass/bloc/account/account_event.dart';
import 'package:vnpass/bloc/account/account_state.dart';
import 'package:vnpass/bloc/auth/auth_bloc.dart';
import 'package:vnpass/bloc/auth/auth_state.dart';
import 'package:vnpass/theme/colors.dart';
import 'package:vnpass/widget/dialog.dart';
import 'package:vnpass/widget/loading.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangePasswordPageState();

}

class _ChangePasswordPageState extends State<ChangePasswordPage>{
  TextEditingController oldPassCtrl = TextEditingController();
  TextEditingController newPassCtrl = TextEditingController();
  TextEditingController confirmNewPassCtrl = TextEditingController();
  FocusNode oldPassFocusNode = FocusNode();
  FocusNode newPassFocusNode = FocusNode();
  FocusNode confirmNewPassFocusNode = FocusNode();
  AccountBloc accountBloc = AccountBloc();

  @override
  void initState() {
    super.initState();
    accountBloc = BlocProvider.of<AccountBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state is ChangePassSuccessState) {
          dialog(context, "Thành công", "Đổi mật khẩu thành công, vui lòng đăng nhập lại để vào ứng dụng", () {
            Navigator.pop(context);
          }, "Xác nhận");
        } else if (state is ChangePassFailState) {
          dialog(context, "Thất bại", state.message , () {
            Navigator.pop(context);
          }, "Xác nhận");
        }
      },
      builder: (context, state) => GestureDetector(
        onTap: () {
          oldPassFocusNode.unfocus();
          newPassFocusNode.unfocus();
          confirmNewPassFocusNode.unfocus();
        },
        child: Scaffold(
          backgroundColor: AppTheme.black,
          appBar: AppBar(backgroundColor: AppTheme.black,),
          body: Container(
            padding: EdgeInsets.only(top: 44, left: 20, right: 20),
            child: Stack(
              children: [
                Column(
                  children: [
                    Text("Đổi mật khẩu", style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),),
                    Container(
                      margin: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        "Nhập mật khẩu hiện tại và mật khẩu mới bạn muốn thay đổi",
                        style: TextStyle(
                            color: AppTheme.white, fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(84, 84, 88, 0.85),
                                  width: 0.33),
                              top: BorderSide(
                                  color: Color.fromRGBO(84, 84, 88, 0.85),
                                  width: 0.33))),
                      height: 56,
                      padding: const EdgeInsets.only(right: 24),
                      child: Row(
                        children: [
                          Flexible(
                              child: TextField(
                                controller: oldPassCtrl,
                                focusNode: oldPassFocusNode,
                                obscureText: true,
                                onChanged: (text) {
                                  // authBloc.password = text;
                                },
                                autocorrect: false,
                                autofocus: true,
                                cursorColor: Colors.white,
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    fontSize: 20.0, color: AppTheme.white),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mật khẩu hiện tại",
                                    hintStyle: TextStyle(
                                        fontSize: 20.0,
                                        color:
                                        Color.fromRGBO(235, 235, 245, 0.3))),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(84, 84, 88, 0.85),
                                  width: 0.33),
                              top: BorderSide(
                                  color: Color.fromRGBO(84, 84, 88, 0.85),
                                  width: 0.33))),
                      height: 56,
                      padding: const EdgeInsets.only(right: 24),
                      child: Row(
                        children: [
                          Flexible(
                              child: TextField(
                                controller: newPassCtrl,
                                focusNode: newPassFocusNode,
                                obscureText: true,
                                onChanged: (text) {
                                  // authBloc.password = text;
                                },
                                autocorrect: false,
                                autofocus: true,
                                cursorColor: Colors.white,
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    fontSize: 20.0, color: AppTheme.white),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Mật khẩu mới",
                                    hintStyle: TextStyle(
                                        fontSize: 20.0,
                                        color:
                                        Color.fromRGBO(235, 235, 245, 0.3))),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(84, 84, 88, 0.85),
                                  width: 0.33),
                              top: BorderSide(
                                  color: Color.fromRGBO(84, 84, 88, 0.85),
                                  width: 0.33))),
                      height: 56,
                      padding: const EdgeInsets.only(right: 24),
                      child: Row(
                        children: [
                          Flexible(
                              child: TextField(
                                controller: confirmNewPassCtrl,
                                focusNode: confirmNewPassFocusNode,
                                obscureText: true,
                                onChanged: (text) {
                                  // authBloc.password = text;
                                },
                                autocorrect: false,
                                autofocus: true,
                                cursorColor: Colors.white,
                                textAlignVertical: TextAlignVertical.center,
                                style: TextStyle(
                                    fontSize: 20.0, color: AppTheme.white),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Nhập lại mật khẩu mới",
                                    hintStyle: TextStyle(
                                        fontSize: 20.0,
                                        color:
                                        Color.fromRGBO(235, 235, 245, 0.3))),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: MediaQuery.of(context).padding.bottom + 16,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          accountBloc.add(ChangePasswordEvent(oldPassCtrl.text, newPassCtrl.text, confirmNewPassCtrl.text));
                        },
                        style: ElevatedButton.styleFrom(primary: AppTheme.greenApp2, padding: EdgeInsets.symmetric(vertical: 15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Xác nhận", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                              if (state is ChangingPassState)
                                SizedBox(width: 10,),
                              if (state is ChangingPassState)
                                SizedBox(height: 15, width: 15, child: Loading(),),
                            ],),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}