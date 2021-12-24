import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/task4/cubit/task4_cubit.dart';
import 'package:training_application/app/scene/task4/cubit/task4_state.dart';

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
          if (state is InputTimeState) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Material(
                      child: TextField(),
                    ),
                    ElevatedButton(
                      child: const Text("Start"),
                      onPressed: () {
                        context.read<Task4ScreenCubit>().startRotation(10);
                      },
                    )
                  ],
                ),
              ),
            );
          } else if (state is TimerState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Text(
                    "${state.time}",
                    style: const TextStyle(
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
