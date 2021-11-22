import 'package:auto_route/auto_route.dart';
import 'package:peepl/common/router/route_guards.dart';
import 'package:peepl/features/guideHome/screens/detailArticle.dart';
import 'package:peepl/features/guideNews/screens/newsScreen.dart';

const newsTab = AutoRoute(
  path: 'newsHome',
  name: 'newsHomeTab',
  page: EmptyRouterPage,
  children: [
    AutoRoute(
      initial: true,
      page: NewsScreen,
      name: 'newsHomeScreen',
      guards: [AuthGuard],
    ),
    AutoRoute(
        page: DetailBlogArticle,
        name: 'detailBlogArticle',
        guards: [AuthGuard]),
  ],
);
