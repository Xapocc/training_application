import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/scene/splash/cubit/router_cubit.dart';
import 'package:training_application/app/scene/task4/cubit/task4_cubit.dart';
import 'package:training_application/app/scene/task4/cubit/task4_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';
import 'package:training_application/domain/task4/task4_timer_domain.dart';

class ScreenTask4 extends StatelessWidget {
  const ScreenTask4(
    RouterCubit rCubit,
    int seconds, {
    Key? key,
  })  : _routerCubit = rCubit,
        _seconds = seconds,
        super(key: key);

  final RouterCubit _routerCubit;
  final int _seconds;

  @override
  Widget build(BuildContext context) {
    int seconds = _seconds;
    return FutureBuilder(
      future: Task4TimerDomain.getTime(),
      builder: (context, snapshot) {
        return BlocProvider(
          create: (context) => Task4ScreenCubit(),
          child: BlocBuilder<Task4ScreenCubit, Task4ScreenState>(
            builder: (context, state) {
              return Container(
                color: AppColors.colorBgTask4Screen,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: AppSizes.widthTextFieldTask4Screen,
                        child: Material(
                          color: AppColors.colorBgTextFieldTask4Screen,
                          child: TextField(
                            enableSuggestions: false,
                            cursorColor: AppColors.colorFgTextFieldTask4Screen,
                            maxLength: AppSizes.maxLengthTextFieldTask4Screen,
                            decoration: InputDecoration(
                              hintText: snapshot.hasData
                                  ? snapshot.hasError
                                      ? AppStrings.textHintDefaultTask4Screen
                                      : "${snapshot.data}"
                                  : AppStrings.textHintDefaultTask4Screen,
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
                              try {
                                seconds = int.parse(text.isEmpty
                                    ? snapshot.data.toString()
                                    : text);
                              } catch (ex) {
                                seconds =
                                    AppSizes.emptyReplacerTextFieldTask4Screen;
                              }
                              context
                                  .read<Task4ScreenCubit>()
                                  .checkIfSecondsInRange(seconds);
                            },
                          ),
                        ),
                      ),
                      _startButton(state, seconds),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _startButton(Task4ScreenState state, int seconds) {
    if (state is EnabledButtonState) {
      return ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateColor.resolveWith(
              (states) => AppColors.colorFgButtonEnabledStartTask4Screen),
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => AppColors.colorBgButtonEnabledStartTask4Screen),
          overlayColor: MaterialStateColor.resolveWith(
              (states) => AppColors.colorOverlayButtonStartTask4Screen),
        ),
        child: const Text(AppStrings.textButtonStartTimerTask4Screen),
        onPressed: () {
          Task4TimerDomain.saveTime(seconds);
          _routerCubit.goToScreenStatistics(seconds);
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
        child: const Text(AppStrings.textButtonStartTimerTask4Screen),
        onPressed: null,
      );
    }
  }
}
