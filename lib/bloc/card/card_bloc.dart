import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpass/bloc/card/card_event.dart';
import 'package:vnpass/bloc/card/card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  bool lockCard = false;
  CardBloc() : super(CardInitialState()){
    on<LockCardEvent>((event, emit) {
      emit(LockCardSuccessState());
    });
  }
}