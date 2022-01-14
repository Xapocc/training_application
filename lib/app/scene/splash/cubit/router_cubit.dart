import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/splash/cubit/router_state.dart';
import 'package:training_application/app/size.dart';


class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const RouterStateSplashScreen()) {
    startApp();
  }

  void goToScreenChoose() => emit(const RouterStateChooseScreen());

  void goToScreenTask3() => emit(const RouterStateTask3Screen());

  void goToScreenTask4() => emit(const RouterStateTask4Screen());

  void goToScreenGpsTracker() => emit(const RouterStateGpsTracker());

  void goToScreenGpsPathMap() => emit(const RouterStateGpsPathMap());

  void goToScreenStatistics(int seconds) =>
      emit(RouterStateStatisticScreen(seconds));

  void startApp() async {
    await Future.delayed(const Duration(seconds: AppSizes.delayStart));

    emit(const RouterStateChooseScreen());
  }
}
