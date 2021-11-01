import 'package:auto_route/auto_route.dart';
import 'package:peepl/common/router/route_guards.dart';
import 'package:peepl/features/guideHome/screens/guideHome.dart';
import 'package:peepl/features/home/screens/action_details.dart';

const guideHomeTab = AutoRoute(
  path: 'guideHome',
  name: 'guideHomeTab',
  page: EmptyRouterPage,
  guards: [AuthGuard],
  children: [
    AutoRoute(
      initial: true,
      page: GuideHomeScreen,
      name: 'guideHomeScreen',
    )
  ],
);
