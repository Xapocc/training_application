import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/task3/cubit/task3_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';

class Task3ScreenCubit extends Cubit<Task3ScreenState> {
  Task3ScreenCubit() : super(LoadingState()) {
    loadData();
  }

  void loadData() async {
    await Future.delayed(
        const Duration(seconds: AppSizes.secondsLoadingTimeTask3Screen));

    var rnd = Random();
    if (rnd.nextInt(AppSizes.randomMaxValue) % AppSizes.randomDivider ==
        AppSizes.randomDataStateDivRem) {
      emit(DataState());
    } else {
      emit(ErrorState(AppStrings.errorMessageTestTask3Screen));
    }
  }
}
