import 'package:flutter/material.dart';

import '../../colors.dart' as colors;
import '../../size.dart' as size;

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.bottomCenter,
          colors: colors.colorsBgGradientSplashScreen,
          radius: size.radiusGradientBgSplashScreen,
          stops: size.stopsGradientBgSplashScreen,
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.flight_takeoff,
          size: size.sizeIconSplashScreen,
          color: colors.colorForegroundSplashScreen,
        ),
      ),
    );
  }
}
