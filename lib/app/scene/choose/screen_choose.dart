import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/router/cubit/router_cubit.dart';
import 'package:training_application/app/size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScreenChoose extends StatelessWidget {
  const ScreenChoose({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.colorBgChooseScreen,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: _chooseScreenButton(
                  context, AppLocalizations.of(context)!.button0ChooseScreen,
                  () {
                BlocProvider.of<RouterCubit>(context).goToScreenTask3();
              }),
            ),
            const Padding(
                padding:
                    EdgeInsets.only(top: AppSizes.paddingButtonChooseScreen)),
            Flexible(
              child: _chooseScreenButton(
                  context, AppLocalizations.of(context)!.button1ChooseScreen,
                  () {
                BlocProvider.of<RouterCubit>(context).goToScreenTask4();
              }),
            ),
            const Padding(
                padding:
                    EdgeInsets.only(top: AppSizes.paddingButtonChooseScreen)),
            Flexible(
              child: _chooseScreenButton(
                  context, AppLocalizations.of(context)!.button2ChooseScreen,
                  () {
                BlocProvider.of<RouterCubit>(context).goToScreenGpsTracker();
              }),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {
                          BlocProvider.of<RouterCubit>(context)
                              .changeL10n(const Locale('en'));
                        },
                        style: TextButton.styleFrom(
                            backgroundColor:
                                AppColors.colorBgButtonChooseScreen,
                            alignment: Alignment.center),
                        child: const Text(
                          "En",
                          style: TextStyle(
                            inherit: false,
                            fontSize: AppSizes.fontSizeButtonChooseScreen,
                            color: AppColors.colorTextButtonChooseScreen,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {
                          BlocProvider.of<RouterCubit>(context)
                              .changeL10n(const Locale('ru'));
                        },
                        style: TextButton.styleFrom(
                            backgroundColor:
                                AppColors.colorBgButtonChooseScreen),
                        child: const Text(
                          "Рус",
                          style: TextStyle(
                            inherit: false,
                            fontSize: AppSizes.fontSizeButtonChooseScreen,
                            color: AppColors.colorTextButtonChooseScreen,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chooseScreenButton(context, String text, VoidCallback callback) {
    // already has the ripple effect as default
    return FractionallySizedBox(
      widthFactor: AppSizes.factorWidthButtonChooseScreen,
      heightFactor: AppSizes.factorHeightButtonChooseScreen,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: AppColors.colorBgButtonChooseScreen),
        onPressed: callback,
        child: AutoSizeText(
          text,
          style: const TextStyle(
            inherit: false,
            fontSize: AppSizes.fontSizeButtonChooseScreen,
            color: AppColors.colorTextButtonChooseScreen,
          ),
        ),
      ),
    );
  }
}
