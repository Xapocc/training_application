import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/colors.dart';
import 'package:training_application/app/router/cubit/router_cubit.dart';
import 'package:training_application/app/scene/login/cubit/login_cubit.dart';
import 'package:training_application/app/scene/login/cubit/login_state.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenCubit(),
      child: BlocBuilder<LoginScreenCubit, LoginScreenState>(
        builder: (context, state) {
          return Container(
            color: AppColors.colorBgChooseScreen,
            child: Center(
              child: IntrinsicWidth(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        "You are not logged in",
                        style: TextStyle(
                          inherit: false,
                          color: Colors.black,
                          fontSize: 26.0,
                        ),
                      ),
                    ),
                    TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.black),
                      child: const Text(
                        "Log in with Google",
                        style: TextStyle(color: Colors.white, fontSize: 26.0),
                      ),
                      onPressed: () async {
                        if (await BlocProvider.of<LoginScreenCubit>(context)
                            .tryGoogleLogin()) {
                          BlocProvider.of<RouterCubit>(context)
                              .goToScreenChoose();
                        } else {
                          return;
                        }
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent),
                      child: const Text(
                        "Continue as guest",
                        style: TextStyle(color: Colors.grey, fontSize: 20.0),
                      ),
                      onPressed: () async {
                        await BlocProvider.of<LoginScreenCubit>(context)
                            .continueAsGuest();

                        BlocProvider.of<RouterCubit>(context)
                            .goToScreenChoose();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
