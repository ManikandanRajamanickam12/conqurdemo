import 'dart:async';

import 'package:conqur/app//splash_page.dart';
import 'package:conqur/helpers/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteInfo {
  const RouteInfo({
    required this.title,
    this.subtitle,
    required this.routeName,
    required this.buildRoute,
  });

  final String title;
  final String? subtitle;
  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  String toString() {
    return '$runtimeType($title $routeName)';
  }
}

Route<dynamic>? getRoute(RouteSettings settings) {
  // Routes, by convention, are split on slashes, like filesystem paths.
  final List<String> path = settings.name!.split('/');
  // We only support paths that start with a slash, so bail if
  // the first component is not empty:
  if (path[0] != '') return null;
  // If the path is "/stock:..." then show a stock page for the
  // specified stock symbol.
  if (path[1].startsWith('card:')) {
    // We don't yet support subpages of a stock, so bail if there's
    // any more path components.
    if (path.length != 2) return null;
    // Extract the symbol part of "stock:..." and return a route
    // for that symbol.
    final String symbol = path[1].substring(6);
    return new CupertinoPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => SplashPage(),
    );
  }
  // The other paths we support are in the routes table.
  return null;
}

typedef Widget RouteWidget(BuildContext context);

final Map<String, WidgetBuilder> _routeMap = new Map<String, WidgetBuilder>();

Map<String, WidgetBuilder> get routeMap => _routeMap;

Map<String, WidgetBuilder> constructRouteMap() {
  List<RouteInfo> routeInfos = getStaticRoutes();
  routeInfos.forEach((route) {
    _routeMap.putIfAbsent(route.routeName, () => route.buildRoute);
  });
  return routeMap;
}

List<RouteInfo> getStaticRoutes() {
  final List<RouteInfo> routes = <RouteInfo>[
    new RouteInfo(
      title: 'Splash',
      subtitle: 'Splash page',
      routeName: "splash",
      buildRoute: (BuildContext context) => SplashPage(),
    ),
  ];
  return routes;
}

class CurrentRouteNavigatorObserver extends NavigatorObserver {
  final _onRouteChange = StreamController<Route?>.broadcast();

  Route? _route;
  Route? _previousRoute;

  // Currently visible route.
  Route? get route => _route;

  Route? get previousRoute => _previousRoute;

  // A stream that emits a value when the currently visible [route] changes.
  Stream<Route?> get onRouteChange => _onRouteChange.stream;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _updateRoute(route, previousRoute: previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (_route == oldRoute) {
      _updateRoute(newRoute);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _updateRoute(previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (route == _route) {
      _updateRoute(previousRoute);
    }
  }

  void _updateRoute(Route? route, {Route? previousRoute}) {
    _route = route;
    _previousRoute = previousRoute;
    _onRouteChange.add(route);
  }
}

class TNavObserver extends NavigatorObserver {
  @override
  void didStopUserGesture() {}

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    Log.i(
        "didReplace: newRoute => ${newRoute?.settings.name} oldRoute =>  ${oldRoute?.settings.name}");
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.i(
        "didRemove: route => ${route.settings.name} previousRoute =>  ${previousRoute?.settings.name}");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.i(
        "didPop: route => ${route.settings.name} previousRoute =>  ${previousRoute?.settings.name}");
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Log.i(
        "didPush: route => ${route.settings.name} previousRoute =>  ${previousRoute?.settings.name}");
  }
}
