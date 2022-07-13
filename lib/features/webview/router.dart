import 'package:auto_route/auto_route.dart';
import 'package:guide_liverpool/common/router/route_guards.dart';
import 'package:guide_liverpool/features/webview/dAppScreen.dart';
import 'package:guide_liverpool/features/webview/shocalWebView.dart';
import 'package:guide_liverpool/features/webview/shopScreen.dart';
import 'package:guide_liverpool/features/webview/vegiWebView.dart';

const webviewTab = AutoRoute(
  path: 'webview',
  name: 'webviewTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      page: ShopScreen,
      name: 'shopScreen',
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: VegiWebView,
      name: 'vegiWebView',
      guards: [AuthGuard],
      meta: {"hideBottomNav": true},
    ),
    AutoRoute(
      page: ShocalWebView,
      name: 'shocalWebView',
      guards: [AuthGuard],
      meta: {"hideBottomNav": true},
    ),
    AutoRoute(
      page: DAppScreen,
      name: 'dAppScreen',
      guards: [AuthGuard],
    ),
  ],
);
