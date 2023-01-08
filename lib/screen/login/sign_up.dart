import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vnpass/bloc/auth/auth_bloc.dart';
import 'package:vnpass/bloc/auth/auth_event.dart';
import 'package:vnpass/bloc/auth/auth_state.dart';
import 'package:vnpass/routes.dart';
import 'package:vnpass/theme/colors.dart';
import 'package:vnpass/widget/loading.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupPageState();

}

class _SignupPageState extends State<SignupPage>{
  AuthBloc authBloc = AuthBloc();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passCrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignupFailState) {
          Fluttertoast.showToast(msg: state.message, toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER);
        } else if (state is SignupSuccessState) {
          Navigator.pushNamedAndRemoveUntil(context, Routes.checkPhone, (route) => false);
        }
      },
      builder: (context, state) => Scaffold(
        backgroundColor: AppTheme.black,
        appBar: AppBar(
          backgroundColor: AppTheme.black,
          iconTheme: IconThemeData(color: AppTheme.white, size: 20),
          title: Text("Đăng ký", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 64.0, left: 60.0, right: 60),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {

                          },
                          child: Text(
                            "Thông tin",
                            style: TextStyle(
                              color: AppTheme.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          "Nhập các thông tin cần thiết của bạn để tiến hành đăng ký",
                          style: TextStyle(
                              color: AppTheme.white, fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 44.0, left: 16.0, right: 16.0),
                  child: Column(
                    children: [
                      // Container(
                      //   // decoration: const BoxDecoration(
                      //   //     border: Border(
                      //   //         bottom: BorderSide(
                      //   //             color:
                      //   //             Color.fromRGBO(84, 84, 88, 0.85),
                      //   //             width: 0.33),
                      //   //         top: BorderSide(
                      //   //             color:
                      //   //             Color.fromRGBO(84, 84, 88, 0.85),
                      //   //             width: 0.33))),
                      //   height: 56,
                      //   padding:
                      //   const EdgeInsets.symmetric(horizontal: 20.0),
                      //   child: Row(
                      //     children: [
                      //       Text(
                      //         "Số điện thoại",
                      //         style: TextStyle(
                      //             color: AppTheme.white, fontSize: 20.0),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color:
                                    Color.fromRGBO(84, 84, 88, 0.85),
                                    width: 0.33),
                                bottom: BorderSide(
                                    color:
                                    Color.fromRGBO(84, 84, 88, 0.85),
                                    width: 0.33))),
                        height: 56,
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "+84",
                              style: TextStyle(
                                  color: AppTheme.white, fontSize: 20.0),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: const VerticalDivider(
                                color: Color.fromRGBO(84, 84, 88, 0.85),
                                width: 0.5,
                              ),
                            ),
                            Flexible(
                                child: TextField(
                                  controller: phoneCtrl,
                                  onChanged: (value) {
                                    setState(() {
                                      authBloc.phone = value;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  autocorrect: false,
                                  autofocus: true,
                                  cursorColor: Colors.white,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      // fontWeight: FontWeight.bold,
                                      color: AppTheme.white),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Số điện thoại (*)",
                                      hintStyle: TextStyle(
                                          fontSize: 22.0,
                                          color: Color.fromRGBO(
                                              235, 235, 245, 0.3))),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin:
                        const EdgeInsets.only(top: 20.0, right: 16.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color.fromRGBO(84, 84, 88, 0.85),
                                          width: 0.33),
                                      top: BorderSide(
                                          color: Color.fromRGBO(84, 84, 88, 0.85),
                                          width: 0.33))),
                              height: 56,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: TextField(
                                        controller: passCrl,
                                        obscureText: true,
                                        onChanged: (text) {
                                          setState(() {
                                            authBloc.password = text;
                                          });
                                        },
                                        autocorrect: false,
                                        autofocus: true,
                                        cursorColor: Colors.white,
                                        textAlignVertical: TextAlignVertical.center,
                                        style: TextStyle(
                                            fontSize: 22.0, color: AppTheme.white),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Mật khẩu (*)",
                                            hintStyle: TextStyle(
                                                fontSize: 22.0,
                                                color:
                                                Color.fromRGBO(235, 235, 245, 0.3))),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                        const EdgeInsets.only(top: 20.0, right: 16.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color.fromRGBO(84, 84, 88, 0.85),
                                          width: 0.33),
                                      top: BorderSide(
                                          color: Color.fromRGBO(84, 84, 88, 0.85),
                                          width: 0.33))),
                              height: 56,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: TextField(
                                        controller: confirmPassCtrl,
                                        obscureText: true,
                                        onChanged: (text) {
                                          setState(() {
                                            authBloc.confirmPassword = text;
                                          });
                                        },
                                        autocorrect: false,
                                        autofocus: true,
                                        cursorColor: Colors.white,
                                        textAlignVertical: TextAlignVertical.center,
                                        style: TextStyle(
                                            fontSize: 22.0, color: AppTheme.white),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Nhập lại mật khẩu (*)",
                                            hintStyle: TextStyle(
                                                fontSize: 22.0,
                                                color:
                                                Color.fromRGBO(235, 235, 245, 0.3))),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                        const EdgeInsets.only(top: 20.0, right: 16.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color.fromRGBO(84, 84, 88, 0.85),
                                          width: 0.33),
                                      top: BorderSide(
                                          color: Color.fromRGBO(84, 84, 88, 0.85),
                                          width: 0.33))),
                              height: 56,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: TextField(
                                        controller: nameCtrl,
                                        obscureText: true,
                                        onChanged: (text) {
                                          setState(() {
                                            authBloc.name = text;
                                          });
                                        },
                                        autocorrect: false,
                                        autofocus: true,
                                        cursorColor: Colors.white,
                                        textAlignVertical: TextAlignVertical.center,
                                        style: TextStyle(
                                            fontSize: 22.0, color: AppTheme.white),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Họ và tên",
                                            hintStyle: TextStyle(
                                                fontSize: 22.0,
                                                color:
                                                Color.fromRGBO(235, 235, 245, 0.3))),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                        const EdgeInsets.only(top: 20.0, right: 16.0),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color.fromRGBO(84, 84, 88, 0.85),
                                          width: 0.33),
                                      top: BorderSide(
                                          color: Color.fromRGBO(84, 84, 88, 0.85),
                                          width: 0.33))),
                              height: 56,
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                children: [
                                  Flexible(
                                      child: TextField(
                                        controller: emailCtrl,
                                        obscureText: true,
                                        onChanged: (text) {
                                          setState(() {
                                            authBloc.email = text;
                                          });
                                        },
                                        autocorrect: false,
                                        autofocus: true,
                                        cursorColor: Colors.white,
                                        textAlignVertical: TextAlignVertical.center,
                                        style: TextStyle(
                                            fontSize: 22.0, color: AppTheme.white),
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email",
                                            hintStyle: TextStyle(
                                                fontSize: 22.0,
                                                color:
                                                Color.fromRGBO(235, 235, 245, 0.3))),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 16.0 + MediaQuery.of(context).padding.bottom,
                left: 0,
                child: TextButton(
                    onPressed: () {
                      authBloc.add(SignupEvent());
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
                              "Đăng ký",
                              style: TextStyle(
                                color: AppTheme.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (state is SigningUpState)
                              const SizedBox(width: 10,),
                            if (state is SigningUpState)
                              SizedBox(
                                height: 15,
                                  width: 15,
                                  child: const Loading())
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