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
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _chooseScreenButton(
                  context, AppLocalizations.of(context)!.button0ChooseScreen,
                  () {
                BlocProvider.of<RouterCubit>(context).goToScreenTask3();
              }),
              _chooseScreenButton(
                  context, AppLocalizations.of(context)!.button1ChooseScreen,
                  () {
                BlocProvider.of<RouterCubit>(context).goToScreenTask4();
              }),
              _chooseScreenButton(
                  context, AppLocalizations.of(context)!.button2ChooseScreen,
                  () {
                BlocProvider.of<RouterCubit>(context).goToScreenGpsTracker();
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _chooseScreenButton(context, "En", () {
                      BlocProvider.of<RouterCubit>(context)
                          .changeL10n(const Locale('en'));
                    }),
                  ),
                  Expanded(
                    child: _chooseScreenButton(context, "Рус", () {
                      BlocProvider.of<RouterCubit>(context)
                          .changeL10n(const Locale('ru'));
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chooseScreenButton(context, String text, VoidCallback callback) {
    // already has the ripple effect as default
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            primary: AppColors.colorBgButtonChooseScreen),
        onPressed: callback,
        child: Text(
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
