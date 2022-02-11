import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:training_application/app/router/cubit/router_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/domain/entities/l10n_entity.dart';
import 'package:training_application/main.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(const RouterStateSplashScreen()) {
    startApp();
  }

  void changeL10n(Locale locale) async {
    emit(RouterStateChooseScreen(locale: locale));
    await l10nChoiceUseCase!.saveChosenL10n(locale.languageCode);
  }

  void goToScreenChoose() =>
      emit(RouterStateChooseScreen(locale: state.locale));

  void goToScreenTask3() => emit(RouterStateTask3Screen(locale: state.locale));

  void goToScreenTask4() => emit(RouterStateTask4Screen(locale: state.locale));

  void goToScreenGpsTracker() =>
      emit(RouterStateGpsTrackerScreen(locale: state.locale));

  void goToScreenGpsPathMap() =>
      emit(RouterStateGpsPathMapScreen(locale: state.locale));

  void goToScreenStatistics(int seconds) =>
      emit(RouterStateStatisticScreen(seconds, locale: state.locale));

  void startApp() async {
    await Future.delayed(const Duration(seconds: AppSizes.delayStart));

    L10nEntity l10nEntity;
    l10nEntity = await l10nChoiceUseCase!.getChosenL10n();

    Locale locale;

    if (l10nEntity.localeCode == "") {
      locale = Locale(Platform.localeName.substring(0, 2));
      await l10nChoiceUseCase!.saveChosenL10n(locale.languageCode);
    } else {
      locale = Locale(l10nEntity.localeCode);
    }

    if (auth?.currentUser?.isAnonymous ?? true) {
      emit(RouterStateLoginScreen(locale: locale));
    } else {
      emit(RouterStateChooseScreen(locale: locale));
    }
  }

  void logOut() async {
    await GoogleSignIn().signOut();
    await auth?.signOut();
    emit(RouterStateLoginScreen(locale: state.locale));
  }
}
