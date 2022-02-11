import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:training_application/app/router/root_router_delegate.dart';
import 'package:training_application/app/router/cubit/router_cubit.dart';
import 'package:training_application/app/router/cubit/router_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:training_application/main.dart';

class AppRoot extends StatelessWidget {
  AppRoot({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouterCubit(),
      child: BlocBuilder<RouterCubit, RouterState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            debugShowCheckedModeBanner: false,
            home: SafeArea(
              child: Builder(builder: (context) {
                l10n = AppLocalizations.of(context);
                return Router(
                  routerDelegate: RootRouterDelegate(
                    navigatorKey,
                    context.read<RouterCubit>(),
                  ),
                  backButtonDispatcher: RootBackButtonDispatcher(),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
