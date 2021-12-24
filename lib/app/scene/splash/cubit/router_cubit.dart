import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/splash/cubit/router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const SplashScreenState()) {
    startApp();
  }

  void goToScreenTask3() => emit(const Task3ScreenState());
  void goToScreenTask4() => emit(const Task4ScreenState());
  void goToScreenStatistics() => emit(const StatisticScreenState());

  void startApp() async {
    await Future.delayed(const Duration(seconds: 3));

    emit(const ChooseScreenState());
  }
}
