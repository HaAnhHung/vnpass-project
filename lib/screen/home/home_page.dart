import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpass/bloc/account/account_bloc.dart';
import 'package:vnpass/bloc/home/home_bloc.dart';
import 'package:vnpass/bloc/home/home_event.dart';
import 'package:vnpass/bloc/home/home_state.dart';
import 'package:vnpass/routes.dart';
import 'package:vnpass/screen/card/card_page.dart';
import 'package:vnpass/screen/profile/profile_page.dart';
import 'package:vnpass/theme/app_icon.dart';
import 'package:vnpass/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  HomeBloc? homeBloc;
  final page = [
    const Home(),
    const CardPage(),
    const ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is GotoProfilePageState) {
          homeBloc?.emit(HomeInitialState());
        } else if (state is GotoCardPageState) {
          homeBloc?.emit(HomeInitialState());
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: page[homeBloc?.pageIndex ?? 0],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) => setState(() => homeBloc?.pageIndex = index),
              selectedItemColor: AppTheme.greenApp2,
              unselectedItemColor: AppTheme.grey2,
              selectedFontSize: 11,
              unselectedFontSize: 12,
              type: BottomNavigationBarType.fixed,
              elevation: 10,
              currentIndex: homeBloc?.pageIndex ?? 0,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(AppIcon.homeIcon, height: 20, width: 20, color: AppTheme.grey2,),
                  label: "Trang chủ",
                  activeIcon: Image.asset(AppIcon.homeIcon, height: 25, width: 25, color: AppTheme.greenApp2,),
                  // backgroundColor: AppTheme.yellowOnDark
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppIcon.cardIcon, height: 20, width: 20, color: AppTheme.grey2,),
                  label: "Quản lí thẻ",
                  activeIcon: Image.asset(AppIcon.cardIcon, height: 25, width: 25, color: AppTheme.greenApp2,),
                  // backgroundColor: AppTheme.yellowOnDark
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(AppIcon.userIcon, height: 20, width: 20, color: AppTheme.grey2,),
                  label: "Cá nhân",
                  activeIcon: Image.asset(AppIcon.userIcon, height: 25, width: 25, color: AppTheme.greenApp2,),
                  // backgroundColor: AppTheme.yellowOnDark
                )
              ],
            )
        );
      }
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  HomeBloc homeBloc = HomeBloc();
  AccountBloc accountBloc = AccountBloc();
  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    accountBloc = BlocProvider.of<AccountBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.greyBackground,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppTheme.greenApp2,
        elevation: 0,
        title: GestureDetector(
          onTap: () {
            homeBloc.pageIndex = 2;
            homeBloc.add(GotoProfilePageEvent());
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: AppTheme.white,
                backgroundImage: AssetImage((accountBloc.fileImage.isEmpty) ? AppImage.accountImage : accountBloc.fileImage),
              ),
              const SizedBox(width: 5,),
              Row(
                children: [
                  Text("Xin chào,", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppTheme.white),),
                  Text(" Hà Anh Hùng", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppTheme.white),)
                ],
              )
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.notifications_active, color: AppTheme.white,),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 175,
              child: Stack(
                children: [
                  Container(
                    height: 125,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppTheme.greenApp2,
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Số dư", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: AppTheme.white),),
                              const SizedBox(height: 5,),
                              Text("2.000.000", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: AppTheme.white),)
                            ],
                          ),
                          // const SizedBox(height: 15,),
                          // Column(
                          //   mainAxisSize: MainAxisSize.min,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text("Số tài khoản:", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: AppTheme.white),),
                          //     const SizedBox(height: 5,),
                          //     Text("1234567890", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: AppTheme.white),)
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: 15,
                    right: 15,
                    child: Container(
                      height: 75,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 3,
                                offset: Offset(0, 3),
                                color: Colors.grey
                            )
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.recharge);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppIcon.walletIcon, height: 35, width: 35, color: AppTheme.greenApp2,),
                                const SizedBox(height: 5,),
                                Text("Nạp tiền", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppTheme.black),)
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushNamed(context, Routes.card);
                              homeBloc.pageIndex = 1;
                              homeBloc.add(GotoCardPageEvent());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(AppIcon.cardIcon, height: 35, width: 35, color: AppTheme.greenApp2,),
                                const SizedBox(height: 5,),
                                Text("Quản lí thẻ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: AppTheme.black),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                child: ListView.separated(
                  itemBuilder: (context, index) => Container(
                    color: AppTheme.grey1,
                    child: ListTile(
                      dense: true,
                      title: const Text("Nạp tiền", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),),
                      subtitle: Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: [
                            Text("26-12-2022", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppTheme.grey2),),
                            const SizedBox(width: 10,),
                            Text("19:21:30", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppTheme.grey2),),
                          ],
                        ),
                      ),
                      trailing: const Text("200.000 đ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),),
                      onTap: () {

                      },
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(height: 0, indent: 10, thickness: 0.5,),
                  itemCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}