import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/splash/cubit/router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const RouterStateSplashScreen()) {
    startApp();
  }

  void goToScreenTask3() => emit(const RouterStateTask3Screen());

  void goToScreenTask4() => emit(const RouterStateTask4Screen());

  void goToScreenStatistics(int seconds) =>
      emit(RouterStateStatisticScreen(seconds));

  void startApp() async {
    await Future.delayed(const Duration(seconds: 3));

    emit(const RouterStateChooseScreen());
  }
}
