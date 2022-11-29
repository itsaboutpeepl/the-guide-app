import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:guide_liverpool/common/router/route_guards.dart';
import 'package:guide_liverpool/features/network/screens/networkScreen.dart';

const networkScreenTab = AutoRoute(
  path: 'networkScreen',
  name: 'networkScreenTab',
  page: EmptyRouterPage,
  guards: [AuthGuard],
  children: [
    CustomRoute(
      initial: true,
      page: NetworkScreen,
      name: 'networkScreen',
      guards: [AuthGuard],
      meta: {'hideBottomNav': true},
      transitionsBuilder: TransitionsBuilders.slideRightWithFade,
    ),
  ],
);
