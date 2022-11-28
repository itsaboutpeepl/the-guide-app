import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:guide_liverpool/common/router/route_guards.dart';
import 'package:guide_liverpool/features/account/screens/account_screen.dart';
import 'package:guide_liverpool/features/account/screens/done_backup_screen.dart';
import 'package:guide_liverpool/features/account/screens/profile.dart';
import 'package:guide_liverpool/features/account/screens/protect_your_wallet.dart';
import 'package:guide_liverpool/features/account/screens/settings.dart';
import 'package:guide_liverpool/features/account/screens/show_mnemonic.dart';
import 'package:guide_liverpool/features/account/screens/verify_mnemonic.dart';
import 'package:guide_liverpool/features/topup/screens/topup.dart';
import 'package:guide_liverpool/features/account/screens/dAppScreen.dart';

const accountTab = AutoRoute(
  path: 'account',
  name: 'accountTab',
  page: EmptyRouterPage,
  guards: [AuthGuard],
  children: [
    AutoRoute(
      page: AccountScreen,
      name: 'accountScreen',
      initial: true,
      guards: [AuthGuard],
    ),
    // AutoRoute(
    //   page: SwitchCommunityScreen,
    //   guards: [AuthGuard],
    // ),
    AutoRoute(
      page: ShowMnemonic,
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: VerifyMnemonic,
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: DoneBackup,
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: SettingsScreen,
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: ProtectYourWallet,
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: ProfileScreen,
      guards: [AuthGuard],
    ),
    AutoRoute(
      path: 'topUp',
      page: TopupScreen,
      guards: [AuthGuard],
    ),
    AutoRoute(
      page: DAppScreen,
      name: 'dAppScreen',
      guards: [AuthGuard],
    ),
  ],
);
