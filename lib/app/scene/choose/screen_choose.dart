import 'package:flutter/material.dart';

class ScreenChoose extends StatelessWidget {
  const ScreenChoose({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(250, 40), primary: Colors.black),
              onPressed: () {},
              child: const Text("Task 1 Screen",
                  style: TextStyle(
                      inherit: false, fontSize: 32.0, color: Colors.white)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: const Size(250, 40), primary: Colors.black),
              onPressed: () {},
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
