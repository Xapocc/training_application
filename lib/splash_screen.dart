import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.bottomCenter,
          colors: [Colors.red, Colors.amber, Colors.amberAccent, Colors.yellow],
          radius: 2.5,
          stops: [0.1, 0.4, 0.6, 1],
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.flight_takeoff,
          size: 64.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
