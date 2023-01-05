import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpass/bloc/recharge_money/recharge_event.dart';
import 'package:vnpass/bloc/recharge_money/recharge_state.dart';

class RechargeBLoc extends Bloc<RechargeEvent, RechargeState> {
  int rechargeMoney = 0;
  RechargeBLoc() : super(RechargeInitialState()){

  }
}