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
                      strokeWidth: 16.0,
                    ),
                    width: 128.0,
                    height: 128.0,
                  ),
                  const SizedBox(
                    height: 16.0,
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$state",
                    style: const TextStyle(
                      inherit: false,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
