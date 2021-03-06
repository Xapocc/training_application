import 'package:flutter/material.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/size.dart';

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
          colors: AppColors.colorsBgGradientSplashScreen,
          radius: AppSizes.radiusGradientBgSplashScreen,
          stops: AppSizes.stopsGradientBgSplashScreen,
        ),
      ),
      child: const Center(
        child: FractionallySizedBox(
          widthFactor: AppSizes.factorSizeIconSplashScreen,
          child: FittedBox(
            child: Icon(
              Icons.flight_takeoff,
              color: AppColors.colorFgSplashScreen,
            ),
          ),
        ),
      ),
    );
  }
}
