import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_cubit.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_state.dart';
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
                  const SizedBox(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 16.0,
                    ),
                    width: 128.0,
                    height: 128.0,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    AppStrings.spinnerText(state.time),
                    style: const TextStyle(
                      fontSize: 24.0,
                      inherit: false,
                      color: Colors.white,
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
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          state is DataState
                              ? "Data state appeared ${(snapshot.data as Map)["dataStateCounter"]} times now"
                              : "Error state appeared ${(snapshot.data as Map)["errorStateCounter"]} times now",
                          style: TextStyle(
                            inherit: false,
                            color: (state is ErrorState)
                                ? Colors.red
                                : Colors.green,
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
        cacheExtent: 10000,
        scrollDirection: Axis.vertical,
        controller: ScrollController(initialScrollOffset: 0),
        itemCount: _images.length ~/ 2,
        itemBuilder: (context, index) {
          return FittedBox(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 8.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 500,
                    child: Image.network(_images[index * 2]),
                  ),
                  const SizedBox(width: 8.0),
                  SizedBox(
                    height: 500,
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
