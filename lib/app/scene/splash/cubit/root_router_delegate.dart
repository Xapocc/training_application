import 'package:flutter/material.dart';
import 'package:training_application/app/scene/choose/screen_choose.dart';
import 'package:training_application/app/scene/statistic/screen_statistic.dart';
import 'package:training_application/app/scene/task3/screen_task3.dart';
import 'package:training_application/app/scene/splash/cubit/router_cubit.dart';
import 'package:training_application/app/scene/splash/cubit/router_state.dart';
import 'package:training_application/app/scene/splash/screen_splash.dart';
import 'package:training_application/app/scene/task4/screen_task4.dart';

class RootRouterDelegate extends RouterDelegate<RouterState> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final RouterCubit _routerCubit;

  RootRouterDelegate(
      GlobalKey<NavigatorState> navigatorKey, RouterCubit routerCubit)
      : _navigatorKey = navigatorKey,
        _routerCubit = routerCubit;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        pages: List.from(_extraPages),
        onPopPage: _onPopPageParser,
      );

  bool _onPopPageParser(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  List<Page> get _extraPages {
    if (_routerCubit.state is RouterStateSplashScreen) {
      return [const MaterialPage(child: ScreenSplash())];
    }

    return [const MaterialPage(child: ScreenChoose()), ..._finalPage];
  }

  List<Page> get _finalPage {
    if (_routerCubit.state is RouterStateTask3Screen) {
      return [const MaterialPage(child: ScreenTask3())];
    }
    if (_routerCubit.state is RouterStateTask4Screen) {
      return [
        MaterialPage(
          child: FutureBuilder(
            future: RouterCubit.getTime(),
            builder: (context, snapshot) => ScreenTask4(
                _routerCubit, RouterCubit.getTimeFromFile(snapshot)),
          ),
        ),
      ];
    }
    if (_routerCubit.state is RouterStateStatisticScreen) {
      return [
        MaterialPage(
          child: ScreenStatistics(
              seconds:
                  (_routerCubit.state as RouterStateStatisticScreen).seconds),
        )
      ];
    }
    return [];
  }

  @override
  Future<bool> popRoute() async {
    _routerCubit.goToScreenChoose();

    return true;
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}

  @override
  Future<void> setNewRoutePath(RouterState configuration) async {}
}
