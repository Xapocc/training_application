import 'package:flutter/material.dart';

import '../../colors.dart' as colors;
import '../../size.dart' as size;

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.bottomCenter,
          colors: colors.backgroundGradientColors,
          radius: size.backgroundGradientRadius,
          stops: size.backgroundGradientStops,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.flight_takeoff,
          size: 64.0,
          color: colors.foregroundColor,
        ),
      ),
    );
  }
}
