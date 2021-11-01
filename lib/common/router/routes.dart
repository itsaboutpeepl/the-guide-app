import 'package:auto_route/auto_route.dart';
import 'package:peepl/common/router/route_guards.dart';
import 'package:peepl/features/account/router/router.dart';
import 'package:peepl/features/buy/router/router.dart';
import 'package:peepl/features/contacts/router/router.dart';
import 'package:peepl/features/guideHome/router/router.dart';
import 'package:peepl/features/help/router/router.dart';
// import 'package:peepl/features/earn/router/router.dart';
import 'package:peepl/features/home/router/router.dart';
import 'package:peepl/features/screens/main_screen.dart';
import 'package:peepl/features/onboard/screens/security_screen.dart';
import 'package:peepl/features/onboard/screens/restore_wallet_screen.dart';
import 'package:peepl/features/onboard/screens/username_screen.dart';
import 'package:peepl/features/onboard/screens/signup_screen.dart';
import 'package:peepl/features/onboard/screens/verify_screen.dart';
import 'package:peepl/features/screens/on_board_screen.dart';
import 'package:peepl/features/screens/pincode_screen.dart';
import 'package:peepl/features/screens/splash_screen.dart';
import 'package:peepl/features/screens/webview_screen.dart';
import 'package:peepl/features/swap/router/swap_router.dart';
import 'package:peepl/features/topup/router/topup_router.dart';
import 'package:peepl/features/webview/router/router.dart';

export 'routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: ChooseSecurityOption),
    AutoRoute(page: PinCodeScreen),
    AutoRoute(page: RestoreFromBackupScreen),
    AutoRoute(page: OnBoardScreen),
    AutoRoute(page: SignUpScreen),
    AutoRoute(page: VerifyPhoneNumber),
    AutoRoute(page: UserNameScreen),
    AutoRoute(page: WebViewScreen, name: 'webview', fullscreenDialog: true),
    AutoRoute(
      page: MainScreen,
      guards: [AuthGuard],
      children: [
        guideHomeTab,
        homeTab,
        topupTab,
        helpTab,
        contactsTab,
        webviewTab,
        buyTab,
        swapTab,
        accountTab,
      ],
    ),
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $RootRouter {}
