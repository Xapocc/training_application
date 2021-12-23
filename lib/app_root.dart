import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_application/app/scene/splash/cubit/root_router_delegate.dart';
import 'package:training_application/app/scene/splash/cubit/router_cubit.dart';
import 'package:training_application/app/scene/splash/cubit/router_state.dart';

class AppRoot extends StatelessWidget {
  AppRoot({Key? key}) : super(key: key);

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RouterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: BlocBuilder<RouterCubit, RouterState>(
            builder: (context, state) => Router(
              routerDelegate: RootRouterDelegate(
                navigatorKey,
                context.read<RouterCubit>(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
