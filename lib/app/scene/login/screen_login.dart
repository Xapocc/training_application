import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/router/cubit/router_cubit.dart';
import 'package:training_application/app/scene/login/cubit/login_cubit.dart';
import 'package:training_application/app/scene/login/cubit/login_state.dart';
import 'package:training_application/main.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: BlocBuilder<LoginScreenCubit, LoginScreenState>(
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                color: AppColors.colorBgChooseScreen,
              ),
              _loginControls(context),
              if (state is AwaitingLoginState) _loadingIndicator(),
            ],
          );
        },
      ),
    );
  }

  Widget _loadingIndicator() {
    return Container(
      color: Colors.white54,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _loginControls(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                l10n.notLoggedInMessage,
                style: const TextStyle(
                  inherit: false,
                  color: Colors.black,
                  fontSize: 26.0,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                l10n.googleLogIn,
                style: const TextStyle(color: Colors.white, fontSize: 26.0),
              ),
              onPressed: () async {
                if (await BlocProvider.of<LoginScreenCubit>(context)
                    .tryGoogleLogin()) {
                  BlocProvider.of<RouterCubit>(context).goToScreenChoose();
                } else {
                  return;
                }
              },
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.transparent),
              child: Text(
                l10n.guestLogIn,
                style: const TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
              onPressed: () async {
                if (await BlocProvider.of<LoginScreenCubit>(context)
                    .continueAsGuest()) {
                  BlocProvider.of<RouterCubit>(context).goToScreenChoose();
                } else {
                  return;
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
