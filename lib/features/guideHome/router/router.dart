import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:guide_liverpool/common/router/route_guards.dart';
import 'package:guide_liverpool/features/guideHome/screens/guideHome.dart';

const guideHomeTab = AutoRoute(
  path: 'guideHome',
  name: 'guideHomeTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      page: GuideHomeScreen,
      name: 'guideHomeScreen',
    ),
  ],
);
