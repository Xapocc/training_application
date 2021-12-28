import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/splash/cubit/router_cubit.dart';
import 'package:training_application/app/scene/task4/cubit/task4_cubit.dart';
import 'package:training_application/app/scene/task4/cubit/task4_state.dart';
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
                padding: const EdgeInsets.all(8.0),
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100.0,
                        child: Material(
                          color: Colors.black,
                          child: TextField(
                            enableSuggestions: false,
                            cursorColor: Colors.white,
                            maxLength: 2,
                            decoration: InputDecoration(
                              hintText: snapshot.hasData
                                  ? snapshot.hasError
                                      ? "0"
                                      : "${snapshot.data}"
                                  : "0",
                              hintStyle: const TextStyle(color: Colors.white30),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white30),
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 64.0,
                                color: Colors.white,
                                backgroundColor: Colors.black,
                                decorationColor: Colors.red),
                            textAlign: TextAlign.center,
                            onChanged: (text) {
                              try {
                                seconds = int.parse(text == ""
                                    ? snapshot.data.toString()
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
                      state is EnabledButtonState
                          ? ElevatedButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                                overlayColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black12),
                              ),
                              child: const Text("Start"),
                              onPressed: () {
                                Task4TimerDomain.saveTime(seconds);
                                _routerCubit.goToScreenStatistics(seconds);
                              },
                            )
                          : ElevatedButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black54),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white12),
                              ),
                              child: const Text("Start"),
                              onPressed: null,
                            ),
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
}
