import 'package:flutter/material.dart';
import 'package:training_application/app/scene/splash/cubit/router_cubit.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/size.dart';
import 'package:training_application/app/string.dart';

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
      color: AppColors.colorBgChooseScreen,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSizes.paddingButtonChooseScreen),
              child: _chooseScreenButton(
                  context, AppStrings.textButton0ChooseScreen, () {
                routerCubit.goToScreenTask3();
              }),
            ),
            _chooseScreenButton(context, AppStrings.textButton1ChooseScreen,
                () {
              routerCubit.goToScreenTask4();
            }),
          ],
        ),
      ),
    );
  }

  Widget _chooseScreenButton(context, String text, VoidCallback callback) {
    // already has the ripple effect as default
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(
              MediaQuery.of(context).size.width *
                  AppSizes.coefficientWidthButtonChooseScreen,
              MediaQuery.of(context).size.width *
                  AppSizes.coefficientHeightButtonChooseScreen),
          primary: AppColors.colorBgButtonChooseScreen),
      onPressed: callback,
      child: Text(text,
          style: const TextStyle(
              inherit: false,
              fontSize: AppSizes.fontSizeButtonChooseScreen,
              color: AppColors.colorTextButtonChooseScreen)),
    );
  }
}
