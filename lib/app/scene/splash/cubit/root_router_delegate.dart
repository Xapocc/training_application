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
        pages: List.from(
            [const MaterialPage(child: ScreenSplash()), ..._extraPages]),
        onPopPage: _onPopPageParser,
      );

  bool _onPopPageParser(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  List<Page> get _extraPages {
    if (_routerCubit.state is ChooseScreenState) {
      return [MaterialPage(child: ScreenChoose(_routerCubit))];
    }
    if (_routerCubit.state is Task3ScreenState) {
      return [const MaterialPage(child: ScreenTask3())];
    }
    if (_routerCubit.state is Task4ScreenState) {
      return [const MaterialPage(child: ScreenTask4())];
    }
    if (_routerCubit.state is StatisticScreenState) {
      return [const MaterialPage(child: ScreenStatistics())];
    }
    return [];
  }

  @override
  Future<bool> popRoute() async {
    return true;
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}

  @override
  Future<void> setNewRoutePath(RouterState configuration) async {}
}
