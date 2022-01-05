import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/splash/cubit/router_state.dart';
import 'package:training_application/app/scene/task4/screen_task4.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/domain/entities/task4_entity.dart';
import 'package:training_application/domain/use_cases/use_case_time.dart';
import 'package:training_application/main.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const RouterStateSplashScreen()) {
    startApp();
  }

  void goToScreenChoose() => emit(const RouterStateChooseScreen());

  void goToScreenTask3() => emit(const RouterStateTask3Screen());

  void goToScreenTask4() => emit(const RouterStateTask4Screen());

  void goToScreenStatistics(int seconds) =>
      emit(RouterStateStatisticScreen(seconds));

  void startApp() async {
    await Future.delayed(const Duration(seconds: 3));

    emit(const RouterStateChooseScreen());
  }

  getTask4Screen() {
    return FutureBuilder(
        future: RouterCubit.getTime(),
        builder: (context, snapshot) {
          return ScreenTask4(RouterCubit.getTimeFromFile(snapshot));
        });
  }

  static int getTimeFromFile(snapshot) {
    return snapshot.hasData
        ? snapshot.hasError
            ? AppSizes.parserExReplacerTextFieldTask4Screen
            : (snapshot.data as Task4Entity).time
        : AppSizes.parserExReplacerTextFieldTask4Screen;
  }

  static getTime() {
    return Task4TimerUseCase.getTime(task4OfflineRepository);
  }
}
