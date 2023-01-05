import 'package:flutter/material.dart';
import 'package:vnpass/routes.dart';
import 'package:vnpass/theme/colors.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PhoneNumberPageState();

}

class _PhoneNumberPageState extends State<PhoneNumberPage>{
  TextEditingController phoneCtrl = TextEditingController();
  String phoneNumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppTheme.black,
      body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 44.0,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {

                            },
                            child: Text(
                              "Trở về",
                              style: TextStyle(
                                  color: AppTheme.white, fontSize: 17.0),
                            )),
                        TextButton(
                          onPressed: () {

                          },
                          child: Text(
                            "Tiếp tục",
                            style: TextStyle(
                                color: AppTheme.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 64.0, left: 60.0, right: 60),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              "Số điện thoại",
                              style: TextStyle(
                                color: AppTheme.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            "Nhập số diện thoại của bạn để tiến hành đăng nhập",
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
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color:
                                      Color.fromRGBO(84, 84, 88, 0.85),
                                      width: 0.33),
                                  top: BorderSide(
                                      color:
                                      Color.fromRGBO(84, 84, 88, 0.85),
                                      width: 0.33))),
                          height: 56,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            children: [
                              Text(
                                "Vietnam",
                                style: TextStyle(
                                    color: AppTheme.white, fontSize: 20.0),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              border: Border(
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
                                        phoneNumber = value;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    autocorrect: false,
                                    autofocus: true,
                                    cursorColor: Colors.white,
                                    textAlignVertical: TextAlignVertical.center,
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.white),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Số điện thoại",
                                        hintStyle: TextStyle(
                                            fontSize: 22.0,
                                            color: Color.fromRGBO(
                                                235, 235, 245, 0.3))),
                                  ))
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
                  bottom: 16.0,
                  left: 0,
                  child: TextButton(
                      onPressed: () {
                        if (phoneNumber.contains("0398290722")) {
                          Navigator.of(context).pushNamed(Routes.login);
                        }
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
          )),
    );
  }

  onPressCheckPhone(String phoneNumber) {
    print("212 ---- check phone");
    if (phoneNumber.contains("0398290722")) {
      Navigator.of(context).pushNamed(Routes.login);
    }
  }
}