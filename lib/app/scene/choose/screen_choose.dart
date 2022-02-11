import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/router/cubit/router_cubit.dart';
import 'package:training_application/app/size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:training_application/main.dart';

class ScreenChoose extends StatelessWidget {
  const ScreenChoose({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBgChooseScreen,
      body: Stack(
        alignment: Alignment.topRight,
        children: [
          _userInfo(context),
          _choseScreenButtons(context),
        ],
      ),
    );
  }

  Widget _userInfo(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                "You are logged in as ${auth?.currentUser == null ? "*no user*" : (auth!.currentUser!.isAnonymous ? "guest" : auth!.currentUser!.displayName)}",
                style: const TextStyle(
                  inherit: false,
                  color: Colors.grey,
                  fontSize: 26.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            style: ButtonStyle(
                overlayColor:
                    MaterialStateColor.resolveWith((states) => Colors.black26)),
            child: const Text(
              "Log out",
              style: TextStyle(
                inherit: false,
                decoration: TextDecoration.underline,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              BlocProvider.of<RouterCubit>(context).logOut();
            },
          ),
        ),
      ],
    );
  }

  Widget _choseScreenButtons(context) {
    bool isLocalized =
        (BlocProvider.of<RouterCubit>(context).state.locale as Locale)
                .languageCode ==
            'ru';

    bool isAuthorised =
        auth?.currentUser == null ? false : !auth!.currentUser!.isAnonymous;

    return Center(
      child: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _chooseScreenButton(
                context, AppLocalizations.of(context)!.button0ChooseScreen, () {
              BlocProvider.of<RouterCubit>(context).goToScreenTask3();
            }, true),
            _chooseScreenButton(
                context, AppLocalizations.of(context)!.button1ChooseScreen, () {
              BlocProvider.of<RouterCubit>(context).goToScreenTask4();
            }, isAuthorised),
            _chooseScreenButton(
                context, AppLocalizations.of(context)!.button2ChooseScreen, () {
              BlocProvider.of<RouterCubit>(context).goToScreenGpsTracker();
            }, isAuthorised),
            TextButton(
              onPressed: null,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      "English",
                      style: TextStyle(
                          fontSize: AppSizes.fontSizeButtonChooseScreen,
                          color: !isLocalized ? Colors.black : Colors.grey),
                    )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Switch(
                      activeColor: Colors.white,
                      inactiveTrackColor: Colors.white54,
                      value: isLocalized,
                      onChanged: (isChecked) {
                        BlocProvider.of<RouterCubit>(context)
                            .changeL10n(Locale(isChecked ? 'ru' : 'en'));
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        "Русский",
                        style: TextStyle(
                          fontSize: AppSizes.fontSizeButtonChooseScreen,
                          color: isLocalized ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chooseScreenButton(
      context, String text, VoidCallback callback, bool isActive) {
    // already has the ripple effect as default
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: isActive ? Colors.black : Colors.black12,
            primary: AppColors.colorBgButtonChooseScreen),
        onPressed: isActive ? callback : null,
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              inherit: false,
              fontSize: AppSizes.fontSizeButtonChooseScreen,
              color: isActive
                  ? AppColors.colorTextButtonChooseScreen
                  : Colors.black26,
            ),
          ),
        ),
      ),
    );
  }
}
