import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/splash/cubit/router_state.dart';
import 'package:training_application/app/size.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const RouterStateSplashScreen()) {
    startApp();
  }

  void changeL10n(Locale locale) {
    emit(RouterStateChooseScreen(locale: locale));
  }

  void goToScreenChoose() =>
      emit(RouterStateChooseScreen(locale: state.locale));

  void goToScreenTask3() => emit(RouterStateTask3Screen(locale: state.locale));

  void goToScreenTask4() => emit(RouterStateTask4Screen(locale: state.locale));

  void goToScreenGpsTracker() =>
      emit(RouterStateGpsTracker(locale: state.locale));

  void goToScreenGpsPathMap() =>
      emit(RouterStateGpsPathMap(locale: state.locale));

  void goToScreenStatistics(int seconds) =>
      emit(RouterStateStatisticScreen(seconds, locale: state.locale));

  void startApp() async {
    await Future.delayed(const Duration(seconds: AppSizes.delayStart));

    emit(RouterStateChooseScreen(locale: state.locale));
  }
}
