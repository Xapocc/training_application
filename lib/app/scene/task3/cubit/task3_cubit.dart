import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/task3/cubit/task3_state.dart';
import 'package:training_application/app/string.dart';

class Task3ScreenCubit extends Cubit<Task3ScreenState> {
  Task3ScreenCubit() : super(LoadingState()) {
    loadData();
  }

  void loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    var rnd = Random();
    if (rnd.nextInt(99) % 2 == 0) {
      emit(DataState());
    } else {
      emit(ErrorState(AppStrings.errorMessageTest));
    }
  }
}
