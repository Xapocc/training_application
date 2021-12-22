import 'main_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(LoadingState()) {
    loadData();
  }

  void loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    var rnd = Random();
    if (rnd.nextInt(99) % 2 == 0) {
      emit(DataState());
    } else {
      emit(ErrorState());
    }
  }
}
