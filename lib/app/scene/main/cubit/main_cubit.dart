import 'main_state.dart';
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
      emit(ErrorState(
          "some long error text with a lot of symbols and word for testing your error screen as it should display every error`s message despite how long it is"));
    }
  }
}
