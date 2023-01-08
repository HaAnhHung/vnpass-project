import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpass/app_container.dart';
import 'package:vnpass/bloc/account/account_bloc.dart';
import 'package:vnpass/bloc/auth/auth_bloc.dart';
import 'package:vnpass/bloc/card/card_bloc.dart';
import 'package:vnpass/bloc/home/home_bloc.dart';
import 'package:vnpass/bloc/recharge_money/recharge_bloc.dart';

class LifeCircleManager extends StatefulWidget {
  const LifeCircleManager({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LifeCircleManagerState();

}

class _LifeCircleManagerState extends State<LifeCircleManager>{
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<RechargeBLoc>(
          create: (context) => RechargeBLoc(),
        ),
        BlocProvider<CardBloc>(
          create: (context) => CardBloc(),
        ),
        BlocProvider<AccountBloc>(
          create: (context) => AccountBloc(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
      ],
        child: const AppContainer(),
    );
  }
}