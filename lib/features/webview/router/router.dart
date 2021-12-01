import 'package:auto_route/auto_route.dart';
import 'package:guide_liverpool/features/screens/inapp_webview_page.dart';

const webviewTab = AutoRoute(
  path: 'webview',
  name: 'webviewTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      page: WebViewWidget,
    ),
  ],
);
