import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:training_application/app/router/cubit/router_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';
import 'package:training_application/domain/entities/l10n_entity.dart';
import 'package:training_application/domain/entities/statistic_entity.dart';
import 'package:training_application/domain/entities/statistic_last_date_entity.dart';
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

  void goToScreenTask4() async {
    StatisticEntity statisticEntity = await statisticUseCase!
        .getStateCountersMap(auth?.currentUser?.uid ?? "");

    StatisticLastDateEntity statisticLastDateEntity =
        await statisticLastDateUseCase!
            .getStateLastDatesMap(auth?.currentUser?.uid ?? "");

    DateTime lastDataDate = DateTime.fromMillisecondsSinceEpoch(
        statisticLastDateEntity.dataStateLastDate);
    DateTime lastErrorDate = DateTime.fromMillisecondsSinceEpoch(
        statisticLastDateEntity.errorStateLastDate);

    emit(RouterStateTask4Screen(
      locale: state.locale,
      dataCounter: statisticEntity.dataStateCounter,
      errorCounter: statisticEntity.errorStateCounter,
      dataDate: statisticLastDateEntity.dataStateLastDate !=
              AppSizes.lastDateDefaultMilliseconds
          ? DateFormat(AppStrings.formatLastDate).format(lastDataDate)
          : l10n.lastDateDefault,
      errorDate: statisticLastDateEntity.errorStateLastDate !=
              AppSizes.lastDateDefaultMilliseconds
          ? DateFormat(AppStrings.formatLastDate).format(lastErrorDate)
          : l10n.lastDateDefault,
    ));
  }

  void goToScreenGpsTracker() =>
      emit(RouterStateGpsTrackerScreen(locale: state.locale));

  void goToScreenGpsPathMap() =>
      emit(RouterStateGpsPathMapScreen(locale: state.locale));

  void goToScreenStatistics(
    int seconds,
    int dataCounter,
    int errorCounter,
    String dataDate,
    String errorDate,
  ) =>
      emit(RouterStateStatisticScreen(
        seconds,
        locale: state.locale,
        dataCounter: dataCounter,
        errorCounter: errorCounter,
        dataDate: dataDate,
        errorDate: errorDate,
      ));

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
