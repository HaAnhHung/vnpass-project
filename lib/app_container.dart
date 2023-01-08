import 'package:flutter/material.dart';
import 'package:vnpass/routes.dart';
import 'package:vnpass/screen/card/card_page.dart';
import 'package:vnpass/screen/home/home_page.dart';
import 'package:vnpass/screen/login/check_phone_number.dart';
import 'package:vnpass/screen/login/login_page.dart';
import 'package:vnpass/screen/login/otp.dart';
import 'package:vnpass/screen/login/sign_up.dart';
import 'package:vnpass/screen/profile/account_page.dart';
import 'package:vnpass/screen/profile/profile_page.dart';
import 'package:vnpass/screen/recharge_money/recharge_page.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppContainerState();

}

class _AppContainerState extends State<AppContainer>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.checkPhone,
      routes: {
        Routes.home: (context) => const HomePage(),
        Routes.recharge: (context) => const RechargePage(),
        Routes.profile: (context) => const ProfilePage(),
        Routes.account: (context) => const AccountPage(),
        Routes.card: (context) => const CardPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.checkPhone: (context) => const PhoneNumberPage(),
        Routes.signup: (context) => const SignupPage(),
        Routes.otp: (context) => const OTPPage(),
      },
    );
  }
}