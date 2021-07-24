import 'package:auto_route/auto_route.dart';
import 'package:peepl/features/topup/screens/topup.dart';
import 'package:peepl/features/topup/screens/topup_explained.dart';

const topupTab = AutoRoute(
  path: 'topup',
  name: 'topupTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      path: 'topUp',
      page: TopupScreen,
    ),
    AutoRoute(
      page: TopupExplained,
    ),
  ],
);
