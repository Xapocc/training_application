import 'main_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class ShowDataCubit extends Cubit<MainScreenState> {
  ShowDataCubit() : super(LoadingState()) {
    loadData();
  }

  void loadData() async {
    emit(LoadingState());

    await Future.delayed(const Duration(seconds: 1));

    var rnd = Random();
    if (rnd.nextInt(99) % 2 == 0) {
      emit(DataState());
    } else {
      emit(ErrorState());
    }
  }
}
