import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(SplashScreenState()) {
    startApp();
  }

  void startApp() async {
    await Future.delayed(const Duration(seconds: 3));

    emit(MainScreenState());
  }
}