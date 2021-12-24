import 'package:flutter/material.dart';
import 'package:training_application/app/scene/splash/cubit/router_cubit.dart';

class ScreenChoose extends StatelessWidget {
  const ScreenChoose(
    RouterCubit rCubit, {
    Key? key,
  })  : routerCubit = rCubit,
        super(key: key);

  final RouterCubit routerCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 40), primary: Colors.black),
              onPressed: () {
                routerCubit.goToScreenTask3();
              },
              child: const Text("Task 1 Screen",
                  style: TextStyle(
                      inherit: false, fontSize: 32.0, color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 40), primary: Colors.black),
              onPressed: () {
                routerCubit.goToScreenTask4();
              },
              child: const Text("Task 4 Screen",
                  style: TextStyle(
                      inherit: false, fontSize: 32.0, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
