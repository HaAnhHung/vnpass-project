import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:vnpass/bloc/card/card_bloc.dart';
import 'package:vnpass/bloc/card/card_state.dart';
import 'package:vnpass/bloc/wallet/wallet_bloc.dart';
import 'package:vnpass/theme/app_icon.dart';
import 'package:vnpass/theme/colors.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CardPageState();

}

class _CardPageState extends State<CardPage>{
  CardBloc? cardBloc;
  WalletBloc walletBloc = WalletBloc();
  TextEditingController pinputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cardBloc = BlocProvider.of<CardBloc>(context);
    walletBloc = BlocProvider.of<WalletBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CardBloc, CardState>(
      listener: (context, state) {
        if (state is LockCardSuccessState) {
          cardBloc?.emit(CardInitialState());
        }
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.greenApp2,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppTheme.white, size: 20),
          title: Text("Quản lí thẻ", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),),
        ),
        body: Container(
          color: AppTheme.greyBackground,
          // padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                margin: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.greenApp,
                        AppTheme.greenApp1
                      ]
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Số dư:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppTheme.white),),
                          const SizedBox(height: 5,),
                          Text((walletBloc.wallet?.balance.toString() ?? "...") + " đ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: AppTheme.white),)
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Số thẻ:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppTheme.white),),
                          const SizedBox(height: 5,),
                          Text(walletBloc.wallet?.code ?? "...", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: AppTheme.white),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: AppTheme.white,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {

                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
                        // margin: EdgeInsets.only(bottom: 15),
                        // color: AppTheme.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Khóa thẻ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                            // Image.asset(AppIcon.arrowRightIcon, scale: 2.25, color: AppTheme.grey3,)
                            CupertinoSwitch(
                                value: cardBloc?.lockCard ?? false,
                                activeColor: AppTheme.greenApp2,
                                onChanged: (value) {
                                  setState(() {
                                    cardBloc?.lockCard = value;
                                  });
                                })
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 1, height: 0,),
                    GestureDetector(
                      onTap: () {
                        onPressChangePassPIN();
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
                        color: AppTheme.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Đổi mã PIN", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                            Image.asset(AppIcon.arrowRightIcon, scale: 2.25, color: AppTheme.grey3,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onPressChangePassPIN() {
    showModalBottomSheet(
        context: context,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        borderSide: BorderSide.none
      ),
      builder: (context) => Container(
        padding: EdgeInsets.only(top: 20, bottom: MediaQuery.of(context).padding.bottom, left: 15, right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Thiết lập mã PIN", style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),),
            SizedBox(height: 20,),
            Pinput(
              length: 6,
              controller: pinputController,
              autofocus: true,
              defaultPinTheme: PinTheme(
                height: 50,
                textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
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
                  width: 40,
                  textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppTheme.greenApp2, width: 2)
                      )
                  )
              ),
              submittedPinTheme: PinTheme(
                  height: 50,
                  width: 40,
                  textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: AppTheme.greenApp2, width: 2)
                      )
                  )
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(primary: AppTheme.greenApp2, padding: EdgeInsets.all(15)),
                  child: Text("Xác nhận", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),)),
            )
          ],
        ),
      ),
    );
  }
}