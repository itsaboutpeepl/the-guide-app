import 'package:auto_route/auto_route.dart';
import 'package:peepl/common/router/route_guards.dart';

import 'package:peepl/features/guideHome/screens/guideHome.dart';
import 'package:peepl/features/screens/help.dart';

const guideHomeTab = AutoRoute(
  path: 'guideHome',
  name: 'guideHomeTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
        initial: true,
        page: GuideHomeScreen,
        name: 'guideHomeScreen',
        guards: [AuthGuard]),
  ],
);
