import 'package:flutter/material.dart';
import 'package:training_application/main_screen_page.dart';
import 'package:training_application/router_cubit.dart';
import 'package:training_application/router_state.dart';
import 'package:training_application/splash_screen_page.dart';

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
            [const MaterialPage(child: SplashScreenPage()), ..._extraPages]),
        onPopPage: _onPopPageParser,
      );

  bool _onPopPageParser(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) return false;
    popRoute();
    return true;
  }

  List<Page> get _extraPages {
    if (_routerCubit.state is SplashScreenState) {
      return [const MaterialPage(child: SplashScreenPage())];
    }
    if (_routerCubit.state is MainScreenState) {
      return [const MaterialPage(child: MainScreenPage())];
    }
    return [];
  }

  @override
  Future<bool> popRoute() async {
    _routerCubit.startApp();
    return true;
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  void removeListener(VoidCallback listener) {}

  @override
  Future<void> setNewRoutePath(RouterState configuration) async {}
}
