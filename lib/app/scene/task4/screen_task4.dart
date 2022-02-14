import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/router/cubit/router_cubit.dart';
import 'package:training_application/app/router/cubit/router_state.dart';
import 'package:training_application/app/scene/task4/cubit/task4_cubit.dart';
import 'package:training_application/app/scene/task4/cubit/task4_state.dart';
import 'package:training_application/app/size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:training_application/main.dart';

class ScreenTask4 extends StatelessWidget {
  const ScreenTask4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Task4ScreenCubit(),
      child: BlocBuilder<Task4ScreenCubit, Task4ScreenState>(
        builder: (context, state) {
          RouterStateData routerState =
              BlocProvider.of<RouterCubit>(context).state as RouterStateData;

          return Container(
            color: AppColors.colorBgTask4Screen,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: true,
              body: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppSizes.fontSizeTextFieldTask4Screen *
                            AppSizes.factorWidthTextFieldTask4Screen,
                        child: Material(
                          color: AppColors.colorBgTextFieldTask4Screen,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            enableSuggestions: false,
                            cursorColor: AppColors.colorFgTextFieldTask4Screen,
                            maxLength: AppSizes.maxLengthTextFieldTask4Screen,
                            decoration: InputDecoration(
                              hintText: state.secondsStart.toString(),
                              hintStyle: const TextStyle(
                                  color: AppColors
                                      .colorFgHintTextFieldTask4Screen),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        AppColors.colorFgTextFieldTask4Screen),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors
                                        .colorFgHintTextFieldTask4Screen),
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: AppSizes.fontSizeTextFieldTask4Screen,
                              color: AppColors.colorFgTextFieldTask4Screen,
                              backgroundColor:
                                  AppColors.colorBgTextFieldTask4Screen,
                            ),
                            textAlign: TextAlign.center,
                            onChanged: (text) {
                              int seconds;

                              try {
                                seconds = int.parse(text.isEmpty
                                    ? state.secondsStart.toString()
                                    : text);
                              } catch (ex) {
                                seconds = 0;
                              }
                              context
                                  .read<Task4ScreenCubit>()
                                  .checkIfSecondsInRange(seconds);
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppSizes.paddingButtonStartTask4Screen),
                        child: _startButton(context, state, routerState),
                      ),
                      FittedBox(
                        child: Container(
                          padding: const EdgeInsets.all(
                              AppSizes.paddingContainerStatisticsTask4Screen),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors
                                    .colorBgTextStateCounterTask4Screen),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: AppSizes
                                        .paddingContainerStatisticsTask4Screen),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: AppSizes
                                              .paddingDataStateCounterTask4Screen),
                                      child: _stateCounterText(
                                          routerState.dataCounter, 1, context),
                                    ),
                                    _stateCounterText(
                                        routerState.errorCounter, 0, context),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: AppSizes
                                            .paddingDataStateCounterTask4Screen),
                                    child: _stateLastDateText(
                                        routerState.dataDate, 1),
                                  ),
                                  _stateLastDateText(routerState.errorDate, 0),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _stateCounterText(counter, isDataState, context) {
    return Text(
      l10n.stateCountersTextTask4Screen2(
          l10n.stateCountersTextTask4Screen1(isDataState), counter),
      style: const TextStyle(
          inherit: false,
          color: AppColors.colorFgTextStateCounterTask4Screen,
          fontSize: AppSizes.fontSizeTextStateCounterTask4Screen),
      textAlign: TextAlign.center,
    );
  }

  Widget _stateLastDateText(date, isDataState) {
    return Text(
      l10n.stateLastDateTextTask4Screen1(
          l10n.stateLastDateTextTask4Screen2(isDataState), date),
      style: const TextStyle(
          inherit: false,
          color: AppColors.colorFgTextStateCounterTask4Screen,
          fontSize: AppSizes.fontSizeTextStateCounterTask4Screen),
      textAlign: TextAlign.center,
    );
  }

  Widget _startButton(
      context, Task4ScreenState state, RouterStateData routerState) {
    if (state.isButtonEnabled) {
      return ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateColor.resolveWith(
              (states) => AppColors.colorFgButtonEnabledStartTask4Screen),
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => AppColors.colorBgButtonEnabledStartTask4Screen),
          overlayColor: MaterialStateColor.resolveWith(
              (states) => AppColors.colorOverlayButtonStartTask4Screen),
        ),
        child:
            Text(AppLocalizations.of(context)!.textButtonStartTimerTask4Screen),
        onPressed: () {
          BlocProvider.of<Task4ScreenCubit>(context).saveTime(state.seconds);
          BlocProvider.of<RouterCubit>(context).goToScreenStatistics(
            state.seconds,
            routerState.dataCounter,
            routerState.errorCounter,
            routerState.dataDate,
            routerState.errorDate,
          );
        },
      );
    } else {
      return ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateColor.resolveWith(
              (states) => AppColors.colorFgButtonDisabledStartTask4Screen),
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => AppColors.colorBgButtonDisabledStartTask4Screen),
        ),
        child:
            Text(AppLocalizations.of(context)!.textButtonStartTimerTask4Screen),
        onPressed: null,
      );
    }
  }
}
