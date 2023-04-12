import 'package:auto_route/auto_route.dart';
import 'package:guide_liverpool/common/router/route_guards.dart';
import 'package:guide_liverpool/common/router/routes.gr.dart';
import 'package:injectable/injectable.dart';

export 'routes.gr.dart';

@AutoRouterConfig()
class RootRouter extends $RootRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: '/'),
    AutoRoute(page: SecurityOptionRoute.page),
    AutoRoute(page: PincodeRoute.page),
    AutoRoute(page: RestoreFromBackupRoute.page),
    AutoRoute(page: OnboardRoute.page),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: VerifyPhoneRoute.page),
    AutoRoute(page: SelectUsernameRoute.page),
    AutoRoute(page: WebViewRoute.page),
    // AutoRoute(
    //   page: MainRouteNoAccRoute.page,
    //   children: [
    //     AutoRoute(
    //       page: HomeRoute.page,
    //       children: [
    //         AutoRoute(page: EventsRoute.page),
    //       ],
    //     ),
    //     AutoRoute(page: NewsRoute.page),
    //   ],
    // ),
    AutoRoute(
      page: MainRoute.page,
      guards: [LoginAuthGuard()],
      children: [
        RedirectRoute(path: '', redirectTo: 'home'),
        AutoRoute(
          path: 'home',
          page: HomeTab.page,
          children: [
            AutoRoute(
              path: '',
              page: HomeRoute.page,
            ),
            AutoRoute(page: EventsRoute.page),
          ],
        ),
        AutoRoute(
            path: 'news',
            page: NewsTab.page,
            children: [AutoRoute(path: '', page: NewsRoute.page)]),
        AutoRoute(
          path: 'account',
          page: AccountTab.page,
          children: [
            AutoRoute(path: '', page: AccountRoute.page),
            AutoRoute(
              page: MnemonicRoute.page,
            ),
            AutoRoute(
              page: VerifyMnemonicRoute.page,
            ),
            AutoRoute(
              page: BackupCompletedRoute.page,
            ),
            AutoRoute(
              page: SettingsRoute.page,
            ),
            AutoRoute(
              page: ProtectWalletRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
            AutoRoute(
              page: TopupRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: 'network',
          page: NetworkTab.page,
          children: [
            AutoRoute(
              path: '',
              page: NetworkRoute.page,
              meta: {'hideBottomNav': true},
            )
          ],
        ),
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/')
  ];
}

@RoutePage(name: 'HomeTab')
class HomeTabPage extends AutoRouter {
  const HomeTabPage({super.key});
}

@RoutePage(name: 'NewsTab')
class NewsTabPage extends AutoRouter {
  const NewsTabPage({super.key});
}

@RoutePage(name: 'AccountTab')
class AccountTabPage extends AutoRouter {
  const AccountTabPage({super.key});
}

@RoutePage(name: 'NetworkTab')
class NetworkTabPage extends AutoRouter {
  const NetworkTabPage({super.key});
}

// @MaterialAutoRouter(
//   replaceInRouteName: 'Route,Route',
//   routes: <AutoRoute>[
//     AutoRoute(
//       page: MainScreenNoAcc,
//       children: [
//         guideHomeTab,
//         newsTab,
//         AutoRoute(
//           page: SettingsScreenNoAccount,
//           name: 'settingsScreenNoAcc',
//         ),
//       ],
//     ),
//     AutoRoute(
//       page: MainScreen,
//       guards: [AuthGuard],
//       children: [
//         guideHomeTab,
//         newsTab,
//         topupTab,
//         accountTab,
//         networkScreenTab,
//       ],
//     ),
//     RedirectRoute(path: '*', redirectTo: '/'),
//   ],
// )
