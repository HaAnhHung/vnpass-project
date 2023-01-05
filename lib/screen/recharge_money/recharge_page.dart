import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpass/bloc/recharge_money/recharge_bloc.dart';
import 'package:vnpass/screen/recharge_money/format_money.dart';
import 'package:vnpass/screen/utils/money_format.dart';
import 'package:vnpass/theme/colors.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RechargePageState();

}

class _RechargePageState extends State<RechargePage>{
  FocusNode rechargeFocusNode = FocusNode();
  TextEditingController rechargeController = TextEditingController();
  RechargeBLoc? rechargeBLoc;

  @override
  void initState() {
    super.initState();
    rechargeBLoc = BlocProvider.of<RechargeBLoc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        rechargeFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Nạp tiền", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),),
          backgroundColor: AppTheme.greenApp2,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppTheme.white,
            size: 20
          ),
        ),
        backgroundColor: AppTheme.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 175,
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        color: AppTheme.greenApp2,
                      ),
                      Positioned(
                          top: 50,
                          left: 15,
                          right: 15,
                          child: Container(
                            height: 125,
                            decoration: BoxDecoration(
                                color: AppTheme.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      color: AppTheme.grey2,
                                      offset: const Offset(0, 3)
                                  )
                                ]
                            ),
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Số dư ví", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                                    Text("2.000.000 đ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),)
                                  ],
                                ),
                                const SizedBox(height: 15,),
                                TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        rechargeBLoc?.rechargeMoney = int.parse(value.replaceAll(".", ""));
                                        formatMoney(value, rechargeController);
                                      } else {
                                        rechargeBLoc?.rechargeMoney = 0;
                                      }
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: rechargeController,
                                  focusNode: rechargeFocusNode,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      hintText: "Nhập số tiền"
                                  ),
                                ),
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: const Text("Chọn nhanh số tiền", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)),
                Container(
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap:() {
                              setState(() {
                                rechargeController.text = MoneyFormat().applyMask(double.parse("50000"));
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(top: 15, bottom: 15),
                              child: const Text("50.000", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.greenApp2.withOpacity(0.2)
                              ),
                              width: (MediaQuery.of(context).size.width - 50)/3,
                            ),
                          ),
                          GestureDetector(
                            onTap:() {
                              setState(() {
                                rechargeController.text = MoneyFormat().applyMask(double.parse("100000"));
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(top: 15, bottom: 15),
                              width: (MediaQuery.of(context).size.width - 50)/3,
                              child: const Text("100.000", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.greenApp2.withOpacity(0.2)
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap:() {
                              setState(() {
                                rechargeController.text = MoneyFormat().applyMask(double.parse("200000"));
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(top: 15, bottom: 15),
                              width: (MediaQuery.of(context).size.width - 50)/3,
                              child: const Text("200.000", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppTheme.greenApp2.withOpacity(0.2)
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap:() {
                                setState(() {
                                  rechargeController.text = MoneyFormat().applyMask(double.parse("500000"));
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 15, bottom: 15),
                                child: const Text("500.000", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppTheme.greenApp2.withOpacity(0.2)
                                ),
                                width: (MediaQuery.of(context).size.width - 50)/3,
                              ),
                            ),
                            GestureDetector(
                              onTap:() {
                                setState(() {
                                  rechargeController.text = MoneyFormat().applyMask(double.parse("1000000"));
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 15, bottom: 15),
                                width: (MediaQuery.of(context).size.width - 50)/3,
                                child: const Text("1.000.000", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppTheme.greenApp2.withOpacity(0.2)
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap:() {
                                setState(() {
                                  rechargeController.text = MoneyFormat().applyMask(double.parse("2000000"));
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.only(top: 15, bottom: 15),
                                width: (MediaQuery.of(context).size.width - 50)/3,
                                child: const Text("2.000.000", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppTheme.greenApp2.withOpacity(0.2)
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: MediaQuery.of(context).padding.bottom),
              child: ElevatedButton(
                onPressed: (rechargeController.text.isNotEmpty) ? () {

                } : null,
                style: ElevatedButton.styleFrom(
                  primary: AppTheme.greenApp2,
                  fixedSize: Size(MediaQuery.of(context).size.width, 53)
                ),
                child: Text("Tiếp tục", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
}