import 'package:flutter/material.dart';
import 'package:training_application/app/scene/main/screen_main.dart';
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
      return [const MaterialPage(child: ScreenTask4())];
    }
    if (_routerCubit.state is MainScreenState) {
      return [const MaterialPage(child: ScreenMain())];
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
