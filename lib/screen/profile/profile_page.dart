import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpass/bloc/account/account_bloc.dart';
import 'package:vnpass/routes.dart';
import 'package:vnpass/theme/app_icon.dart';
import 'package:vnpass/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{
  AccountBloc accountBloc = AccountBloc();
  @override
  void initState() {
    super.initState();
    accountBloc = BlocProvider.of<AccountBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.greenApp2,
        elevation: 0,
        title: Text("Cá nhân", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: AppTheme.white),),
      ),
      backgroundColor: AppTheme.greyBackground,
      body: Container(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.account);
              },
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 5),
                color: AppTheme.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius: 30, backgroundImage: AssetImage((accountBloc.fileImage.isEmpty) ? AppImage.accountImage : accountBloc.fileImage), backgroundColor: AppTheme.white,),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Hà Anh Hùng", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,),),
                            const SizedBox(height: 5,),
                            Text("0398290722", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppTheme.grey2),)
                          ],
                        )
                      ],
                    ),
                    Image.asset(AppIcon.arrowRightIcon, scale: 2.5, color: AppTheme.grey3,)
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 7),
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.recharge);
                      },
                    style: TextButton.styleFrom(
                      backgroundColor: AppTheme.white,
                      elevation: 0,
                      primary: AppTheme.black,
                      padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 5)
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(AppIcon.walletIcon, scale: 2.75, color: AppTheme.greenApp1,),
                              SizedBox(width: 10,),
                              const Text("Số dư", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
                            ],
                          ),
                          Row(
                            children: [
                              const Text("2.000.000", style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                              Image.asset(AppIcon.arrowRightIcon, scale: 2.5, color: AppTheme.grey3,)
                            ],)
                        ],
                      ),
                  ),
                  Divider(height: 0, thickness: 0.5, indent: 15,),
                  TextButton(
                    onPressed: () {

                    },
                    style: TextButton.styleFrom(
                        backgroundColor: AppTheme.white,
                        elevation: 0,
                        primary: AppTheme.black,
                        padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(AppIcon.cardIcon, scale: 2.75, color: AppTheme.greenApp1,),
                            SizedBox(width: 10,),
                            const Text("Ngân hàng", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                          ],
                        ),
                        Image.asset(AppIcon.arrowRightIcon, scale: 2.5, color: AppTheme.grey3,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 7,),
            Column(
              children: [
                TextButton(
                  onPressed: () {

                  },
                  style: TextButton.styleFrom(
                      backgroundColor: AppTheme.white,
                      elevation: 0,
                      primary: AppTheme.black,
                      padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppIcon.keyIcon, scale: 2.75, color: AppTheme.greenApp1,),
                          SizedBox(width: 10,),
                          const Text("Mật khẩu thanh toán", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                        ],
                      ),
                      Image.asset(AppIcon.arrowRightIcon, scale: 2.5, color: AppTheme.grey3,)
                    ],
                  ),
                ),
                Divider(height: 0, thickness: 0.5, indent: 15),
                TextButton(
                  onPressed: () {

                  },
                  style: TextButton.styleFrom(
                      backgroundColor: AppTheme.white,
                      elevation: 0,
                      primary: AppTheme.black,
                      padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15, right: 5)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppIcon.supportIcon, scale: 2.75, color: AppTheme.greenApp1,),
                          SizedBox(width: 10,),
                          const Text("Hỗ trợ", style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                        ],
                      ),
                      Image.asset(AppIcon.arrowRightIcon, scale: 2.5, color: AppTheme.grey3,)
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}