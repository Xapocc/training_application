import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_cubit.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';

class ScreenStatistics extends StatelessWidget {
  const ScreenStatistics({
    required int seconds,
    Key? key,
  })  : _seconds = seconds,
        super(key: key);

  final int _seconds;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorBgStatisticScreen,
      child: BlocProvider(
        create: (context) => StatisticScreenCubit(_seconds),
        child: BlocBuilder<StatisticScreenCubit, StatisticScreenState>(
          builder: (context, state) {
            if (state is TimerState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: const CircularProgressIndicator(
                      color: AppColors.colorProgressIndicatorStatisticScreen,
                      strokeWidth:
                          AppSizes.widthStrokeProgressIndicatorStatisticScreen,
                    ),
                    width: MediaQuery.of(context).size.width *
                        AppSizes
                            .coefficientWidthProgressIndicatorStatisticScreen,
                    height: MediaQuery.of(context).size.width *
                        AppSizes
                            .coefficientWidthProgressIndicatorStatisticScreen,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: AppSizes
                            .paddingTextProgressIndicatorStatisticScreen),
                    child: Text(
                      AppStrings.spinnerTextStatisticScreen(state.time),
                      style: const TextStyle(
                        fontSize: AppSizes
                            .fontSizeTextProgressIndicatorStatisticScreen,
                        inherit: false,
                        color: AppColors.colorProgressTextStatisticScreen,
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return FutureBuilder(
                future: StatisticScreenCubit.getStateCountersMap(),
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (snapshot.hasData)
                        Padding(
                          padding: const EdgeInsets.all(
                              AppSizes.paddingTextStateCounterStatisticScreen),
                          child: Text(
                            AppStrings.stateCountersTextStatisticScreen(
                                (snapshot.data as Map)[state is DataState
                                    ? AppStrings
                                        .dataStateFieldNameStatisticScreen
                                    : AppStrings
                                        .errorStateFieldNameStatisticScreen],
                                state is DataState),
                            style: TextStyle(
                              inherit: false,
                              color: (state is ErrorState)
                                  ? AppColors.colorTextErrorStateStatisticScreen
                                  : AppColors.colorTextDataStateStatisticScreen,
                            ),
                          ),
                        ),
                      if (state is DataState) _dataListView(state),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _dataListView(StatisticScreenState state) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingListViewItemStatisticScreen),
        child: ListView.builder(
          cacheExtent: AppSizes.cacheItemsNumberStatisticScreen,
          scrollDirection: Axis.vertical,
          itemCount: StatisticScreenState.loadedImages.length ~/ 2,
          itemBuilder: (context, index) {
            return FittedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: AppSizes.paddingListViewItemStatisticScreen),
                child: Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: AppSizes.paddingListViewItemStatisticScreen),
                        child: StatisticScreenState.loadedImages[index * 2],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: StatisticScreenState.loadedImages[index * 2 + 1],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
