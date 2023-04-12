import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/utils/log/log.dart';

class RouteLogger extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log.info('New route pushed: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log.info('Route popped: ${previousRoute!.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log.info('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log.info('Tab route re-visited: ${route.name}');
  }
}
