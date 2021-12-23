import 'package:flutter/material.dart';

class ScreenChoose extends StatelessWidget {
  const ScreenChoose({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.blue)),
              onPressed: () {},
              child: const Text("Task 1 Screen",
                  style: TextStyle(
                      inherit: false, fontSize: 32.0, color: Colors.black)),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.black)),
                onPressed: () {},
                child: const Text("Task 4 Screen",
                    style: TextStyle(
                        inherit: false, fontSize: 32.0, color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
