import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_cubit.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';
import 'package:training_application/domain/statistic/statistic_domain.dart';

class ScreenStatistics extends StatelessWidget {
  const ScreenStatistics({
    required int seconds,
    Key? key,
  })  : _seconds = seconds,
        super(key: key);

  final int _seconds;
  static const List<String> _images = AppStrings.imagesCatsUrls;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticScreenCubit(_seconds),
      child: BlocBuilder<StatisticScreenCubit, StatisticScreenState>(
        builder: (context, state) {
          if (state is TimerState) {
            return Center(
              child: Column(
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
              ),
            );
          } else {
            return FutureBuilder(
              future: StatisticDomain.getStateCountersMap(),
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
                                  ? AppStrings.dataStateFieldNameStatisticScreen
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
                    if (state is DataState) _dataListView(),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _dataListView() {
    return Flexible(
      child: ListView.builder(
        cacheExtent: AppSizes.cacheItemsNumberStatisticScreen,
        scrollDirection: Axis.vertical,
        itemCount: _images.length ~/ 2,
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
                      child: Image.network(_images[index * 2]),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Image.network(_images[index * 2 + 1]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
