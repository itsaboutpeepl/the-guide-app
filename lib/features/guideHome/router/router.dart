import 'package:auto_route/auto_route.dart';
import 'package:peepl/common/router/route_guards.dart';
import 'package:peepl/features/guideHome/screens/detailArticle.dart';
import 'package:peepl/features/guideHome/screens/detailVideoArticle.dart';
import 'package:peepl/features/guideHome/screens/guideHome.dart';

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
    AutoRoute(
        page: DetailBlogArticle,
        name: 'detailBlogArticle',
        guards: [AuthGuard]),
    CustomRoute(
        page: DetailVideoArticle,
        name: 'detailVideoArticle',
        guards: [AuthGuard],
        transitionsBuilder: TransitionsBuilders.slideBottom,
        durationInMilliseconds: 400),
  ],
);
