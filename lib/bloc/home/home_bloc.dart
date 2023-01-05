import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vnpass/bloc/home/home_event.dart';
import 'package:vnpass/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int pageIndex = 0;
  HomeBloc() : super(HomeInitialState()){
    on<GotoProfilePageEvent>((event, emit) {
      emit(GotoProfilePageState());
    });
    on<GotoCardPageEvent>((event, emit) {
      emit(GotoCardPageState());
    });
  }

}