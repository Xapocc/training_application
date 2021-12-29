import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_cubit.dart';
import 'package:training_application/app/scene/statistic/cubit/statistic_state.dart';

class ScreenStatistics extends StatelessWidget {
  const ScreenStatistics({
    required int seconds,
    Key? key,
  })  : _seconds = seconds,
        super(key: key);

  final int _seconds;
  static const List<String> _images = [
    "https://unsplash.com/photos/rW-I87aPY5Y/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MXx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/gKXKBY-C-Dk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Mnx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/so5nsYDOdxw/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8Nnx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/mJaD10XeD7w/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8NHx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/OzAeZPNsLXk/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8M3x8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/NodtnCsLdTE/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8OHx8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/ZCHj_2lJP00/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8N3x8Y2F0fHwwfHx8fDE2NDA3MDYwMDY",
    "https://unsplash.com/photos/nKC772R_qog/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTF8fGNhdHx8MHx8fHwxNjQwNzA2MDA2",
    "https://unsplash.com/photos/LEpfefQf4rU/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTR8fGNhdHx8MHx8fHwxNjQwNzA2MDA2",
    "https://unsplash.com/photos/75715CVEJhI/download?ixid=MnwxMjA3fDB8MXxzZWFyY2h8MTV8fGNhdHx8MHx8fHwxNjQwNzA2MDA2",
  ];

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
                    "Please wait ${state.time} seconds",
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "$state was seen N times now",
                    style: TextStyle(
                      inherit: false,
                      color: (state is ErrorState) ? Colors.red : Colors.green,
                    ),
                  ),
                ),
                if (state is DataState) _dataListView(),
              ],
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
