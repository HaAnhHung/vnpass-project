import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:vnpass/bloc/account/account_bloc.dart';
import 'package:vnpass/bloc/account/account_event.dart';
import 'package:vnpass/bloc/account/account_state.dart';
import 'package:vnpass/routes.dart';
import 'package:vnpass/theme/app_icon.dart';
import 'package:vnpass/theme/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  AccountBloc accountBloc = AccountBloc();
  TextEditingController changePassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();
  FocusNode changePassFocusNode = FocusNode();
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
        if (state is ChooseImageSuccessState) {
          Navigator.pop(context);
          accountBloc.emit(AccountInitialState());
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: AppTheme.greyBackground,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppTheme.white, size: 20),
          elevation: 0,
          backgroundColor: AppTheme.greenApp2,
          title: Text(
            "Thông tin tài khoản",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              color: AppTheme.greenApp2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        accountBloc.add(ShowDialogUpdateAvatarEvent(context));
                      },
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: AppTheme.white,
                        backgroundImage: AssetImage((accountBloc.fileImage.isEmpty)
                            ? AppImage.accountImage
                            : accountBloc.fileImage),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        "Hà Anh Hùng",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "0398290722",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400, color: AppTheme.grey1),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: AppTheme.white,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: AppTheme.white,
                    side: BorderSide(
                      color: AppTheme.white,
                    ),
                    elevation: 0,
                    primary: AppTheme.black,
                    padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Địa chỉ",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    Image.asset(
                      AppIcon.arrowRightIcon,
                      scale: 2.5,
                      color: AppTheme.grey3,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: AppTheme.white,
              child: TextButton(
                onPressed: () {
                  onPressForgotPass();
                },
                style: TextButton.styleFrom(
                    backgroundColor: AppTheme.white,
                    side: BorderSide(
                      color: AppTheme.white,
                    ),
                    elevation: 0,
                    primary: AppTheme.black,
                    padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Quên mật khẩu",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    Image.asset(
                      AppIcon.arrowRightIcon,
                      scale: 2.5,
                      color: AppTheme.grey3,
                    )
                  ],
                ),
              ),
            ),
            const Divider(height: 0, thickness: 0.5, indent: 15),
            Container(
              color: AppTheme.white,
              child: TextButton(
                onPressed: () {
                  onPressChangePass();
                },
                style: TextButton.styleFrom(
                    backgroundColor: AppTheme.white,
                    side: BorderSide(
                      color: AppTheme.white,
                    ),
                    elevation: 0,
                    primary: AppTheme.black,
                    padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Đổi mật khẩu",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    Image.asset(
                      AppIcon.arrowRightIcon,
                      scale: 2.5,
                      color: AppTheme.grey3,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: AppTheme.white,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: AppTheme.white,
                    side: BorderSide(
                      color: AppTheme.white,
                    ),
                    elevation: 0,
                    primary: AppTheme.black,
                    padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Đóng tài khoản",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    Image.asset(
                      AppIcon.arrowRightIcon,
                      scale: 2.5,
                      color: AppTheme.grey3,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: AppTheme.white,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.checkPhone, (route) => false);
                },
                style: TextButton.styleFrom(
                    backgroundColor: AppTheme.white,
                    side: BorderSide(
                      color: AppTheme.white,
                    ),
                    elevation: 0,
                    primary: AppTheme.black,
                    padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Đăng xuất",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                    Image.asset(
                      AppIcon.arrowRightIcon,
                      scale: 2.5,
                      color: AppTheme.grey3,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onPressForgotPass() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      builder: (context) => BlocConsumer<AccountBloc, AccountState>(
        listener: (context, state) {
          if (state is SendOTPSuccessState) {
            accountBloc.emit(AccountInitialState());
          } else if (state is ConfirmOTPSuccessState) {
            // accountBloc.emit(AccountInitialState());
          }
        },
        builder: (context, state) => Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!accountBloc.sentOTP)
                const Text(
                  "Nhập số điện thoại",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                )
              else
                const Text(
                  "Nhập mã OTP",
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                ),
              const SizedBox(
                height: 10,
              ),
              if (!accountBloc.sentOTP)
                Text("Mã OTP sẽ được gửi về số điện thoại này",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: AppTheme.grey2))
              else
                Text("Nhập mã OTP vừa được gửi về số điện thoại của bạn",
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w400, color: AppTheme.grey2)),
              const SizedBox(
                height: 30,
              ),
              if (!accountBloc.sentOTP)
                TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              )
              else
                Pinput(
                  length: 6,
                  defaultPinTheme: PinTheme(
                      height: 40,
                      textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                      width: 40,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.grey2),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  focusedPinTheme: PinTheme(
                      height: 40,
                      textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                      width: 40,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.greenApp2),
                        borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  submittedPinTheme: PinTheme(
                      height: 40,
                      textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                      width: 40,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: AppTheme.greenApp2),
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              const SizedBox(
                height: 30,
              ),
              if (!accountBloc.sentOTP)
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        accountBloc.add(SendOTPEvent());
                      },
                      style: ElevatedButton.styleFrom(
                          primary: AppTheme.greenApp2,
                          padding: const EdgeInsets.only(top: 15, bottom: 15)),
                      child: const Text(
                        "Gửi mã OTP",
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                      )),
                )
              else
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        accountBloc.add(ConfirmOTPEvent());
                      },
                      style: ElevatedButton.styleFrom(
                          primary: AppTheme.greenApp2,
                          padding: const EdgeInsets.only(top: 15, bottom: 15)),
                      child: const Text(
                        "Xác nhận",
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                      )),
                ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressChangePass() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
        ),
        builder: (context) => BlocConsumer<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state is CheckOldPassSuccessState) {
              accountBloc.emit(AccountInitialState());
            } else if (state is ConfirmNewPassSuccessState) {
              Fluttertoast.showToast(msg: "Đổi mật khẩu thành công", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
              Navigator.pop(context);
              newPassController.clear();
              confirmNewPassController.clear();
              accountBloc.emit(AccountInitialState());
            } else if (state is ConfirmNewPassFailState) {
              Fluttertoast.showToast(msg: "Mật khẩu nhập lại không trùng khớp", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
            }
          },
          builder: (context, state) => GestureDetector(
            onTap: () {
              changePassFocusNode.unfocus();
              newPassFocusNode.unfocus();
              confirmNewPassFocusNode.unfocus();
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
              ),
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!accountBloc.checkOldPass)
                    Text("Nhập mật khẩu cũ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),)
                  else
                    Text("Mật khẩu mới", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  if (!accountBloc.checkOldPass)
                    TextField(
                    focusNode: changePassFocusNode,
                    controller: changePassController,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  )
                  else
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Mật khẩu mới", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                            SizedBox(height: 10,),
                            TextField(
                              focusNode: newPassFocusNode,
                              controller: newPassController,
                              decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                              ),
                            ),
                          ]
                        ),
                        SizedBox(height: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nhập lại mật khẩu mới", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                            SizedBox(height: 10,),
                            TextField(
                              focusNode: confirmNewPassFocusNode,
                              controller: confirmNewPassController,
                              decoration: InputDecoration(
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  SizedBox(height: 20,),
                  if (!accountBloc.checkOldPass)
                    SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {
                          onPressCheckOldPass();
                        },
                      style: ElevatedButton.styleFrom(primary: AppTheme.greenApp2, padding: EdgeInsets.only(top: 15, bottom: 15)),
                        child: Text("Xác nhận", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                    ),
                  )
                  else
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          onPressConfirmNewPass();
                        },
                        style: ElevatedButton.styleFrom(primary: AppTheme.greenApp2, padding: EdgeInsets.only(top: 15, bottom: 15)),
                        child: Text("Đổi mật khẩu", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),),
                      ),
                    ),
                  SizedBox(height: MediaQuery.of(context).padding.bottom),
                ],
              ),
            ),
          ),
        ),
    );
  }

  void onPressCheckOldPass() {
    accountBloc.add(CheckOldPassEvent());
  }

  void onPressConfirmNewPass() {
    accountBloc.add(ConfirmNewPassEvent(newPassController.text, confirmNewPassController.text));
  }
}
