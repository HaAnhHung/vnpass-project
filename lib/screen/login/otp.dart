import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:vnpass/theme/colors.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTPPageState();

}

class _OTPPageState extends State<OTPPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        backgroundColor: AppTheme.black,
        iconTheme: IconThemeData(color: AppTheme.white, size: 20),
        title: Text("OTP", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),),
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
                      "Mã OTP",
                      style: TextStyle(
                        color: AppTheme.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Nhập mã OTP vừa được gửi về số điện thoại của bạn",
                    style: TextStyle(
                        color: AppTheme.white, fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 50,),
                Pinput(
                  length: 6,
                  defaultPinTheme: PinTheme(
                      height: 50,
                      textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),
                      width: 40,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppTheme.grey2, width: 2)
                          )
                      )
                  ),
                  focusedPinTheme: PinTheme(
                      height: 50,
                      textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),
                      width: 40,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppTheme.greenApp2, width: 2)
                          )
                      )
                  ),
                  submittedPinTheme: PinTheme(
                      height: 50,
                      textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),
                      width: 40,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: AppTheme.greenApp2, width: 2)
                          )
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
      ),
    );
  }
}