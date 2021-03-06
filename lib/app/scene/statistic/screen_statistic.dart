import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_cubit.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_state.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/main.dart';

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
              return _timerState(state, context);
            } else {
              return _dataOrErrorState(state, context);
            }
          },
        ),
      ),
    );
  }

  Widget _dataOrErrorState(state, context) {
    BlocProvider.of<StatisticScreenCubit>(context)
        .getStateCountersMapStream(state);
    BlocProvider.of<StatisticScreenCubit>(context)
        .getStateLastDateMapStream(state);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(
              AppSizes.paddingTextStateCounterStatisticScreen),
          child: Text(
            l10n.stateCountersTextStatisticScreen1(
                    l10n.stateCountersTextStatisticScreen2(
                        state is DataState ? 1 : 0),
                    (state as PostTimerState).counter) +
                "\n" +
                l10n.stateLastDateTextStatisticScreen(
                  state.lastDate,
                ),
            textAlign: TextAlign.center,
            style: TextStyle(
              inherit: false,
              color: (state is ErrorState)
                  ? AppColors.colorTextErrorStateStatisticScreen
                  : AppColors.colorTextDataStateStatisticScreen,
            ),
          ),
        ),
        if (state is DataState)
          _dataListView(
            context,
            state,
            AppSizes.numberOfImagesInRowStatisticScreen,
            AppSizes.showUncompletedRowStatisticScreen,
            2,
          ),
      ],
    );
  }

  Widget _timerState(state, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: FractionallySizedBox(
            widthFactor: AppSizes.factorWidthProgressIndicatorStatisticScreen,
            child: AspectRatio(
              aspectRatio: 1,
              child: CircularProgressIndicator(
                color: AppColors.colorProgressIndicatorStatisticScreen,
                strokeWidth:
                    AppSizes.widthStrokeProgressIndicatorStatisticScreen,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: AppSizes.paddingTextProgressIndicatorStatisticScreen),
          child: FittedBox(
            child: AutoSizeText(
              l10n.spinnerTextStatisticScreen(state.time),
              wrapWords: false,
              style: const TextStyle(
                fontSize: AppSizes.fontSizeTextProgressIndicatorStatisticScreen,
                inherit: false,
                color: AppColors.colorProgressTextStatisticScreen,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Returns Flexible with ListView of Rows of Images [state.imagesUrls].
  ///
  /// Set [showUncompletedRow] to 'true' if you want to display row
  /// with number of items lesser than [itemsInRow].
  /// Don't set [numberOfItemsToDisplay] to use the whole list.
  Widget _dataListView(context, DataState state, int imagesInRow,
      [bool showUncompletedRow = false, int numberOfItemsToDisplay = -1]) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingListViewItemStatisticScreen),
        child: ListView.builder(
          cacheExtent: AppSizes.cacheItemsNumberStatisticScreen,
          scrollDirection: Axis.vertical,
          itemCount: getNumberOfRows(context, state, imagesInRow,
              showUncompletedRow, numberOfItemsToDisplay),
          itemBuilder: (context, index) {
            return getImagesRow(
                context, state, index, imagesInRow, numberOfItemsToDisplay);
          },
        ),
      ),
    );
  }

  /// Returns the number of rows for [state.imagesUrls] list.
  ///
  /// Set [showUncompletedRow] to 'true' if you want to display row
  /// with number of items lesser than [itemsInRow].
  /// Don't set [numberOfItemsToDisplay] to use the whole list.
  int getNumberOfRows(context, DataState state, itemsInRow,
      [bool showUncompletedRow = false, int numberOfItemsToDisplay = -1]) {
    if (itemsInRow <= 0) itemsInRow = 1;
    if (numberOfItemsToDisplay < 0) {
      numberOfItemsToDisplay = state.imagesUrls.length;
    }

    // number of completed rows
    int numberOfRows = numberOfItemsToDisplay ~/ itemsInRow;

    // add 1 for uncompleted row if necessary
    if (numberOfItemsToDisplay % itemsInRow != 0) {
      numberOfRows += showUncompletedRow ? 1 : 0;
    }

    return numberOfRows;
  }

  /// Returns the row for the itemBuilder of ListView.
  ///
  /// Don't set [numberOfItemsToDisplay] to use the whole list.
  Widget getImagesRow(context, DataState state, int index, int itemsInRow,
      [int numberOfItemsToDisplay = -1]) {
    if (itemsInRow <= 0) itemsInRow = 1;
    if (numberOfItemsToDisplay < 0) {
      numberOfItemsToDisplay = state.imagesUrls.length;
    }

    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.only(
            bottom: AppSizes.paddingListViewItemStatisticScreen),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: AppSizes.paddingListViewItemStatisticScreen),
          child: Row(
            children: _getRowItems(
                context, state, index, itemsInRow, numberOfItemsToDisplay),
          ),
        ),
      ),
    );
  }

  List<Widget> _getRowItems(context, DataState state, int index, int itemsInRow,
      int numberOfItemsToDisplay) {
    List<Widget> itemsList = List.empty(growable: true);
    int itemInRowIndex = 0;

    while (itemInRowIndex < itemsInRow) {
      int itemIndex = index * itemsInRow + itemInRowIndex;
      itemsList.add(
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
              padding: EdgeInsets.only(
                  // if current item is the last one in a row padding = 0
                  right: (itemInRowIndex == itemsInRow - 1 ||
                          itemIndex >= numberOfItemsToDisplay - 1)
                      ? 0
                      : AppSizes.paddingListViewItemStatisticScreen),
              // if out of items uses a Container() as a placeholder
              child: (itemIndex < numberOfItemsToDisplay)
                  ? Image.network(
                      state.imagesUrls[itemIndex],
                      scale: AppSizes.scaleImageStatisticScreen,
                    )
                  : Container()),
        ),
      );

      itemInRowIndex++;
    }

    return itemsList;
  }
}
