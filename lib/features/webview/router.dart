import 'package:auto_route/auto_route.dart';
import 'package:guide_liverpool/common/router/route_guards.dart';
import 'package:guide_liverpool/features/guideNews/screens/newsScreen.dart';
import 'package:guide_liverpool/features/webview/webviewScreen.dart';

const webviewTab = AutoRoute(
  path: 'webview',
  name: 'webviewTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      page: WebviewScreen,
      name: 'webViewScreen',
      guards: [AuthGuard],
    ),
  ],
);
