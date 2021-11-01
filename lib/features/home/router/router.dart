import 'package:auto_route/auto_route.dart';
import 'package:peepl/common/router/route_guards.dart';
import 'package:peepl/features/home/screens/action_details.dart';
import 'package:peepl/features/home/screens/home.dart';

const homeTab = AutoRoute(
  path: 'home',
  name: 'homeTab',
  page: EmptyRouterPage,
  guards: [AuthGuard],
  children: [
    AutoRoute(
      page: HomeScreen,
      name: 'homeScreen',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: ActionDetailsScreen,
      guards: [AuthGuard],
    ),
  ],
);
