// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:contacts_service/contacts_service.dart' as _i39;
import 'package:flutter/material.dart' as _i36;

import '../../features/account/screens/account_screen.dart' as _i28;
import '../../features/account/screens/done_backup_screen.dart' as _i31;
import '../../features/account/screens/profile.dart' as _i34;
import '../../features/account/screens/protect_your_wallet.dart' as _i33;
import '../../features/account/screens/settings.dart' as _i32;
import '../../features/account/screens/show_mnemonic.dart' as _i29;
import '../../features/account/screens/social_screen.dart' as _i35;
import '../../features/account/screens/verify_mnemonic.dart' as _i30;
import '../../features/buy/screens/business.dart' as _i25;
import '../../features/buy/screens/buy.dart' as _i24;
import '../../features/contacts/screens/contacts_list.dart' as _i19;
import '../../features/contacts/screens/send_amount.dart' as _i20;
import '../../features/contacts/screens/send_review.dart' as _i21;
import '../../features/contacts/screens/send_success.dart' as _i22;
import '../../features/contacts/send_amount_arguments.dart' as _i40;
import '../../features/guideHome/screens/guideHome.dart' as _i12;
import '../../features/guideNews/screens/newsScreen.dart' as _i13;
import '../../features/home/screens/action_details.dart' as _i15;
import '../../features/home/screens/home.dart' as _i14;
import '../../features/onboard/screens/restore_wallet_screen.dart' as _i4;
import '../../features/onboard/screens/security_screen.dart' as _i2;
import '../../features/onboard/screens/signup_screen.dart' as _i6;
import '../../features/onboard/screens/username_screen.dart' as _i8;
import '../../features/onboard/screens/verify_screen.dart' as _i7;
import '../../features/screens/help.dart' as _i18;
import '../../features/screens/inapp_webview_page.dart' as _i23;
import '../../features/screens/main_screen.dart' as _i10;
import '../../features/screens/on_board_screen.dart' as _i5;
import '../../features/screens/pincode_screen.dart' as _i3;
import '../../features/screens/splash_screen.dart' as _i1;
import '../../features/screens/webview_screen.dart' as _i9;
import '../../features/swap/screens/review_swap.dart' as _i27;
import '../../features/swap/screens/swap.dart' as _i26;
import '../../features/topup/screens/topup.dart' as _i16;
import '../../features/topup/screens/topup_explained.dart' as _i17;
import '../../models/actions/wallet_action.dart' as _i38;
import '../../models/community/business.dart' as _i41;
import '../../models/swap/swap.dart' as _i43;
import '../../models/tokens/token.dart' as _i42;
import 'route_guards.dart' as _i37;

class RootRouter extends _i11.RootStackRouter {
  RootRouter(
      {_i36.GlobalKey<_i36.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i37.AuthGuard authGuard;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      final args = routeData.argsAs<SplashScreenArgs>(
          orElse: () => const SplashScreenArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.SplashScreen(
              key: args.key, onLoginResult: args.onLoginResult));
    },
    ChooseSecurityOption.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.ChooseSecurityOption());
    },
    PinCodeScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.PinCodeScreen());
    },
    RestoreFromBackupScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.RestoreFromBackupScreen());
    },
    OnBoardScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.OnBoardScreen());
    },
    SignUpScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.SignUpScreen());
    },
    VerifyPhoneNumber.name: (routeData) {
      final args = routeData.argsAs<VerifyPhoneNumberArgs>(
          orElse: () => const VerifyPhoneNumberArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.VerifyPhoneNumber(verificationId: args.verificationId));
    },
    UserNameScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.UserNameScreen());
    },
    Webview.name: (routeData) {
      final args = routeData.argsAs<WebviewArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.WebViewScreen(args.url, args.title,
              onPageStarted: args.onPageStarted),
          fullscreenDialog: true);
    },
    MainScreen.name: (routeData) {
      final args = routeData.argsAs<MainScreenArgs>(
          orElse: () => const MainScreenArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.MainScreen(key: args.key));
    },
    GuideHomeTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    NewsHomeTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    HomeTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    TopupTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    HelpTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    ContactsTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    WebviewTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    BuyTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    SwapTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    AccountTab.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    GuideHomeScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.GuideHomeScreen());
    },
    NewsHomeScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i13.NewsScreen());
    },
    HomeScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.HomeScreen());
    },
    ActionDetailsScreen.name: (routeData) {
      final args = routeData.argsAs<ActionDetailsScreenArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i15.ActionDetailsScreen(
              action: args.action,
              image: args.image,
              displayName: args.displayName,
              accountAddress: args.accountAddress,
              symbol: args.symbol,
              contact: args.contact));
    },
    TopupScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i16.TopupScreen());
    },
    TopupExplained.name: (routeData) {
      final args = routeData.argsAs<TopupExplainedArgs>(
          orElse: () => const TopupExplainedArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i17.TopupExplained(key: args.key));
    },
    HelpScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.HelpScreen());
    },
    ContactsList.name: (routeData) {
      final args = routeData.argsAs<ContactsListArgs>(
          orElse: () => const ContactsListArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i19.ContactsList(pageArgs: args.pageArgs));
    },
    SendAmountScreen.name: (routeData) {
      final args = routeData.argsAs<SendAmountScreenArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i20.SendAmountScreen(pageArgs: args.pageArgs));
    },
    SendReviewScreen.name: (routeData) {
      final args = routeData.argsAs<SendReviewScreenArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i21.SendReviewScreen(pageArgs: args.pageArgs));
    },
    SendSuccessScreen.name: (routeData) {
      final args = routeData.argsAs<SendSuccessScreenArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i22.SendSuccessScreen(pageArgs: args.pageArgs));
    },
    WebViewWidget.name: (routeData) {
      final args = routeData.argsAs<WebViewWidgetArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i23.WebViewWidget(
              url: args.url, walletAddress: args.walletAddress));
    },
    BuyScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i24.BuyScreen());
    },
    BusinessScreen.name: (routeData) {
      final args = routeData.argsAs<BusinessScreenArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i25.BusinessScreen(business: args.business, token: args.token));
    },
    SwapScreen.name: (routeData) {
      final args = routeData.argsAs<SwapScreenArgs>(
          orElse: () => const SwapScreenArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i26.SwapScreen(key: args.key, primaryToken: args.primaryToken));
    },
    ReviewSwapScreen.name: (routeData) {
      final args = routeData.argsAs<ReviewSwapScreenArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i27.ReviewSwapScreen(
              tradeInfo: args.tradeInfo,
              rateInfo: args.rateInfo,
              swapRequestBody: args.swapRequestBody));
    },
    AccountScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i28.AccountScreen());
    },
    ShowMnemonic.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i29.ShowMnemonic());
    },
    VerifyMnemonic.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i30.VerifyMnemonic());
    },
    DoneBackup.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i31.DoneBackup());
    },
    SettingsScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i32.SettingsScreen());
    },
    ProtectYourWallet.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i33.ProtectYourWallet());
    },
    ProfileScreen.name: (routeData) {
      final args = routeData.argsAs<ProfileScreenArgs>(
          orElse: () => const ProfileScreenArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i34.ProfileScreen(key: args.key));
    },
    SocialScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i35.SocialScreen());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(SplashScreen.name, path: '/'),
        _i11.RouteConfig(ChooseSecurityOption.name,
            path: '/choose-security-option'),
        _i11.RouteConfig(PinCodeScreen.name, path: '/pin-code-screen'),
        _i11.RouteConfig(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen'),
        _i11.RouteConfig(OnBoardScreen.name, path: '/on-board-screen'),
        _i11.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i11.RouteConfig(VerifyPhoneNumber.name, path: '/verify-phone-number'),
        _i11.RouteConfig(UserNameScreen.name, path: '/user-name-screen'),
        _i11.RouteConfig(Webview.name, path: '/web-view-screen'),
        _i11.RouteConfig(MainScreen.name, path: '/main-screen', guards: [
          authGuard
        ], children: [
          _i11.RouteConfig(GuideHomeTab.name,
              path: 'guideHome',
              parent: MainScreen.name,
              children: [
                _i11.RouteConfig(GuideHomeScreen.name,
                    path: '', parent: GuideHomeTab.name, guards: [authGuard])
              ]),
          _i11.RouteConfig(NewsHomeTab.name,
              path: 'newsHome',
              parent: MainScreen.name,
              children: [
                _i11.RouteConfig(NewsHomeScreen.name,
                    path: '', parent: NewsHomeTab.name, guards: [authGuard])
              ]),
          _i11.RouteConfig(HomeTab.name,
              path: 'home',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i11.RouteConfig(HomeScreen.name,
                    path: '', parent: HomeTab.name, guards: [authGuard]),
                _i11.RouteConfig(ActionDetailsScreen.name,
                    path: 'action-details-screen',
                    parent: HomeTab.name,
                    guards: [authGuard])
              ]),
          _i11.RouteConfig(TopupTab.name,
              path: 'topup',
              parent: MainScreen.name,
              children: [
                _i11.RouteConfig('#redirect',
                    path: '',
                    parent: TopupTab.name,
                    redirectTo: 'topUp',
                    fullMatch: true),
                _i11.RouteConfig(TopupScreen.name,
                    path: 'topUp', parent: TopupTab.name),
                _i11.RouteConfig(TopupExplained.name,
                    path: 'topup-explained', parent: TopupTab.name)
              ]),
          _i11.RouteConfig(HelpTab.name,
              path: 'help',
              parent: MainScreen.name,
              children: [
                _i11.RouteConfig(HelpScreen.name,
                    path: '', parent: HelpTab.name)
              ]),
          _i11.RouteConfig(ContactsTab.name,
              path: 'contacts',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i11.RouteConfig(ContactsList.name,
                    path: '', parent: ContactsTab.name, guards: [authGuard]),
                _i11.RouteConfig(SendAmountScreen.name,
                    path: 'send-amount',
                    parent: ContactsTab.name,
                    guards: [authGuard]),
                _i11.RouteConfig(SendReviewScreen.name,
                    path: 'send-review',
                    parent: ContactsTab.name,
                    guards: [authGuard]),
                _i11.RouteConfig(SendSuccessScreen.name,
                    path: 'send-success',
                    parent: ContactsTab.name,
                    guards: [authGuard])
              ]),
          _i11.RouteConfig(WebviewTab.name,
              path: 'webview',
              parent: MainScreen.name,
              children: [
                _i11.RouteConfig(WebViewWidget.name,
                    path: '', parent: WebviewTab.name)
              ]),
          _i11.RouteConfig(BuyTab.name,
              path: 'buy',
              parent: MainScreen.name,
              children: [
                _i11.RouteConfig(BuyScreen.name, path: '', parent: BuyTab.name),
                _i11.RouteConfig(BusinessScreen.name,
                    path: 'business-screen', parent: BuyTab.name)
              ]),
          _i11.RouteConfig(SwapTab.name,
              path: 'swap',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i11.RouteConfig(SwapScreen.name,
                    path: '', parent: SwapTab.name, guards: [authGuard]),
                _i11.RouteConfig(ReviewSwapScreen.name,
                    path: 'review-swap-screen',
                    parent: SwapTab.name,
                    guards: [authGuard])
              ]),
          _i11.RouteConfig(AccountTab.name,
              path: 'account',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i11.RouteConfig(AccountScreen.name,
                    path: '', parent: AccountTab.name, guards: [authGuard]),
                _i11.RouteConfig(ShowMnemonic.name,
                    path: 'show-mnemonic',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i11.RouteConfig(VerifyMnemonic.name,
                    path: 'verify-mnemonic',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i11.RouteConfig(DoneBackup.name,
                    path: 'done-backup',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i11.RouteConfig(SettingsScreen.name,
                    path: 'settings-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i11.RouteConfig(ProtectYourWallet.name,
                    path: 'protect-your-wallet',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i11.RouteConfig(ProfileScreen.name,
                    path: 'profile-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i11.RouteConfig(SocialScreen.name,
                    path: 'social-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i11.RouteConfig(TopupScreen.name,
                    path: 'topUp', parent: AccountTab.name, guards: [authGuard])
              ])
        ]),
        _i11.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i11.PageRouteInfo<SplashScreenArgs> {
  SplashScreen({_i36.Key? key, void Function(bool)? onLoginResult})
      : super(SplashScreen.name,
            path: '/',
            args: SplashScreenArgs(key: key, onLoginResult: onLoginResult));

  static const String name = 'SplashScreen';
}

class SplashScreenArgs {
  const SplashScreenArgs({this.key, this.onLoginResult});

  final _i36.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'SplashScreenArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i2.ChooseSecurityOption]
class ChooseSecurityOption extends _i11.PageRouteInfo<void> {
  const ChooseSecurityOption()
      : super(ChooseSecurityOption.name, path: '/choose-security-option');

  static const String name = 'ChooseSecurityOption';
}

/// generated route for
/// [_i3.PinCodeScreen]
class PinCodeScreen extends _i11.PageRouteInfo<void> {
  const PinCodeScreen() : super(PinCodeScreen.name, path: '/pin-code-screen');

  static const String name = 'PinCodeScreen';
}

/// generated route for
/// [_i4.RestoreFromBackupScreen]
class RestoreFromBackupScreen extends _i11.PageRouteInfo<void> {
  const RestoreFromBackupScreen()
      : super(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen');

  static const String name = 'RestoreFromBackupScreen';
}

/// generated route for
/// [_i5.OnBoardScreen]
class OnBoardScreen extends _i11.PageRouteInfo<void> {
  const OnBoardScreen() : super(OnBoardScreen.name, path: '/on-board-screen');

  static const String name = 'OnBoardScreen';
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreen extends _i11.PageRouteInfo<void> {
  const SignUpScreen() : super(SignUpScreen.name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i7.VerifyPhoneNumber]
class VerifyPhoneNumber extends _i11.PageRouteInfo<VerifyPhoneNumberArgs> {
  VerifyPhoneNumber({String? verificationId})
      : super(VerifyPhoneNumber.name,
            path: '/verify-phone-number',
            args: VerifyPhoneNumberArgs(verificationId: verificationId));

  static const String name = 'VerifyPhoneNumber';
}

class VerifyPhoneNumberArgs {
  const VerifyPhoneNumberArgs({this.verificationId});

  final String? verificationId;

  @override
  String toString() {
    return 'VerifyPhoneNumberArgs{verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i8.UserNameScreen]
class UserNameScreen extends _i11.PageRouteInfo<void> {
  const UserNameScreen()
      : super(UserNameScreen.name, path: '/user-name-screen');

  static const String name = 'UserNameScreen';
}

/// generated route for
/// [_i9.WebViewScreen]
class Webview extends _i11.PageRouteInfo<WebviewArgs> {
  Webview(
      {required String url,
      required String title,
      void Function(String)? onPageStarted})
      : super(Webview.name,
            path: '/web-view-screen',
            args: WebviewArgs(
                url: url, title: title, onPageStarted: onPageStarted));

  static const String name = 'Webview';
}

class WebviewArgs {
  const WebviewArgs(
      {required this.url, required this.title, this.onPageStarted});

  final String url;

  final String title;

  final void Function(String)? onPageStarted;

  @override
  String toString() {
    return 'WebviewArgs{url: $url, title: $title, onPageStarted: $onPageStarted}';
  }
}

/// generated route for
/// [_i10.MainScreen]
class MainScreen extends _i11.PageRouteInfo<MainScreenArgs> {
  MainScreen({_i36.Key? key, List<_i11.PageRouteInfo>? children})
      : super(MainScreen.name,
            path: '/main-screen',
            args: MainScreenArgs(key: key),
            initialChildren: children);

  static const String name = 'MainScreen';
}

class MainScreenArgs {
  const MainScreenArgs({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return 'MainScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.EmptyRouterPage]
class GuideHomeTab extends _i11.PageRouteInfo<void> {
  const GuideHomeTab({List<_i11.PageRouteInfo>? children})
      : super(GuideHomeTab.name, path: 'guideHome', initialChildren: children);

  static const String name = 'GuideHomeTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class NewsHomeTab extends _i11.PageRouteInfo<void> {
  const NewsHomeTab({List<_i11.PageRouteInfo>? children})
      : super(NewsHomeTab.name, path: 'newsHome', initialChildren: children);

  static const String name = 'NewsHomeTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class HomeTab extends _i11.PageRouteInfo<void> {
  const HomeTab({List<_i11.PageRouteInfo>? children})
      : super(HomeTab.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class TopupTab extends _i11.PageRouteInfo<void> {
  const TopupTab({List<_i11.PageRouteInfo>? children})
      : super(TopupTab.name, path: 'topup', initialChildren: children);

  static const String name = 'TopupTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class HelpTab extends _i11.PageRouteInfo<void> {
  const HelpTab({List<_i11.PageRouteInfo>? children})
      : super(HelpTab.name, path: 'help', initialChildren: children);

  static const String name = 'HelpTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class ContactsTab extends _i11.PageRouteInfo<void> {
  const ContactsTab({List<_i11.PageRouteInfo>? children})
      : super(ContactsTab.name, path: 'contacts', initialChildren: children);

  static const String name = 'ContactsTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class WebviewTab extends _i11.PageRouteInfo<void> {
  const WebviewTab({List<_i11.PageRouteInfo>? children})
      : super(WebviewTab.name, path: 'webview', initialChildren: children);

  static const String name = 'WebviewTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class BuyTab extends _i11.PageRouteInfo<void> {
  const BuyTab({List<_i11.PageRouteInfo>? children})
      : super(BuyTab.name, path: 'buy', initialChildren: children);

  static const String name = 'BuyTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class SwapTab extends _i11.PageRouteInfo<void> {
  const SwapTab({List<_i11.PageRouteInfo>? children})
      : super(SwapTab.name, path: 'swap', initialChildren: children);

  static const String name = 'SwapTab';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class AccountTab extends _i11.PageRouteInfo<void> {
  const AccountTab({List<_i11.PageRouteInfo>? children})
      : super(AccountTab.name, path: 'account', initialChildren: children);

  static const String name = 'AccountTab';
}

/// generated route for
/// [_i12.GuideHomeScreen]
class GuideHomeScreen extends _i11.PageRouteInfo<void> {
  const GuideHomeScreen() : super(GuideHomeScreen.name, path: '');

  static const String name = 'GuideHomeScreen';
}

/// generated route for
/// [_i13.NewsScreen]
class NewsHomeScreen extends _i11.PageRouteInfo<void> {
  const NewsHomeScreen() : super(NewsHomeScreen.name, path: '');

  static const String name = 'NewsHomeScreen';
}

/// generated route for
/// [_i14.HomeScreen]
class HomeScreen extends _i11.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i15.ActionDetailsScreen]
class ActionDetailsScreen extends _i11.PageRouteInfo<ActionDetailsScreenArgs> {
  ActionDetailsScreen(
      {required _i38.WalletAction action,
      _i36.ImageProvider<Object>? image,
      required String displayName,
      String? accountAddress,
      required String symbol,
      _i39.Contact? contact})
      : super(ActionDetailsScreen.name,
            path: 'action-details-screen',
            args: ActionDetailsScreenArgs(
                action: action,
                image: image,
                displayName: displayName,
                accountAddress: accountAddress,
                symbol: symbol,
                contact: contact));

  static const String name = 'ActionDetailsScreen';
}

class ActionDetailsScreenArgs {
  const ActionDetailsScreenArgs(
      {required this.action,
      this.image,
      required this.displayName,
      this.accountAddress,
      required this.symbol,
      this.contact});

  final _i38.WalletAction action;

  final _i36.ImageProvider<Object>? image;

  final String displayName;

  final String? accountAddress;

  final String symbol;

  final _i39.Contact? contact;

  @override
  String toString() {
    return 'ActionDetailsScreenArgs{action: $action, image: $image, displayName: $displayName, accountAddress: $accountAddress, symbol: $symbol, contact: $contact}';
  }
}

/// generated route for
/// [_i16.TopupScreen]
class TopupScreen extends _i11.PageRouteInfo<void> {
  const TopupScreen() : super(TopupScreen.name, path: 'topUp');

  static const String name = 'TopupScreen';
}

/// generated route for
/// [_i17.TopupExplained]
class TopupExplained extends _i11.PageRouteInfo<TopupExplainedArgs> {
  TopupExplained({_i36.Key? key})
      : super(TopupExplained.name,
            path: 'topup-explained', args: TopupExplainedArgs(key: key));

  static const String name = 'TopupExplained';
}

class TopupExplainedArgs {
  const TopupExplainedArgs({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return 'TopupExplainedArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.HelpScreen]
class HelpScreen extends _i11.PageRouteInfo<void> {
  const HelpScreen() : super(HelpScreen.name, path: '');

  static const String name = 'HelpScreen';
}

/// generated route for
/// [_i19.ContactsList]
class ContactsList extends _i11.PageRouteInfo<ContactsListArgs> {
  ContactsList({_i40.SendFlowArguments? pageArgs})
      : super(ContactsList.name,
            path: '', args: ContactsListArgs(pageArgs: pageArgs));

  static const String name = 'ContactsList';
}

class ContactsListArgs {
  const ContactsListArgs({this.pageArgs});

  final _i40.SendFlowArguments? pageArgs;

  @override
  String toString() {
    return 'ContactsListArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i20.SendAmountScreen]
class SendAmountScreen extends _i11.PageRouteInfo<SendAmountScreenArgs> {
  SendAmountScreen({required _i40.SendFlowArguments pageArgs})
      : super(SendAmountScreen.name,
            path: 'send-amount',
            args: SendAmountScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendAmountScreen';
}

class SendAmountScreenArgs {
  const SendAmountScreenArgs({required this.pageArgs});

  final _i40.SendFlowArguments pageArgs;

  @override
  String toString() {
    return 'SendAmountScreenArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i21.SendReviewScreen]
class SendReviewScreen extends _i11.PageRouteInfo<SendReviewScreenArgs> {
  SendReviewScreen({required _i40.SendFlowArguments pageArgs})
      : super(SendReviewScreen.name,
            path: 'send-review',
            args: SendReviewScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendReviewScreen';
}

class SendReviewScreenArgs {
  const SendReviewScreenArgs({required this.pageArgs});

  final _i40.SendFlowArguments pageArgs;

  @override
  String toString() {
    return 'SendReviewScreenArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i22.SendSuccessScreen]
class SendSuccessScreen extends _i11.PageRouteInfo<SendSuccessScreenArgs> {
  SendSuccessScreen({required _i40.SendFlowArguments pageArgs})
      : super(SendSuccessScreen.name,
            path: 'send-success',
            args: SendSuccessScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendSuccessScreen';
}

class SendSuccessScreenArgs {
  const SendSuccessScreenArgs({required this.pageArgs});

  final _i40.SendFlowArguments pageArgs;

  @override
  String toString() {
    return 'SendSuccessScreenArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i23.WebViewWidget]
class WebViewWidget extends _i11.PageRouteInfo<WebViewWidgetArgs> {
  WebViewWidget({required String url, required String walletAddress})
      : super(WebViewWidget.name,
            path: '',
            args: WebViewWidgetArgs(url: url, walletAddress: walletAddress));

  static const String name = 'WebViewWidget';
}

class WebViewWidgetArgs {
  const WebViewWidgetArgs({required this.url, required this.walletAddress});

  final String url;

  final String walletAddress;

  @override
  String toString() {
    return 'WebViewWidgetArgs{url: $url, walletAddress: $walletAddress}';
  }
}

/// generated route for
/// [_i24.BuyScreen]
class BuyScreen extends _i11.PageRouteInfo<void> {
  const BuyScreen() : super(BuyScreen.name, path: '');

  static const String name = 'BuyScreen';
}

/// generated route for
/// [_i25.BusinessScreen]
class BusinessScreen extends _i11.PageRouteInfo<BusinessScreenArgs> {
  BusinessScreen({required _i41.Business business, required _i42.Token token})
      : super(BusinessScreen.name,
            path: 'business-screen',
            args: BusinessScreenArgs(business: business, token: token));

  static const String name = 'BusinessScreen';
}

class BusinessScreenArgs {
  const BusinessScreenArgs({required this.business, required this.token});

  final _i41.Business business;

  final _i42.Token token;

  @override
  String toString() {
    return 'BusinessScreenArgs{business: $business, token: $token}';
  }
}

/// generated route for
/// [_i26.SwapScreen]
class SwapScreen extends _i11.PageRouteInfo<SwapScreenArgs> {
  SwapScreen({_i36.Key? key, _i42.Token? primaryToken})
      : super(SwapScreen.name,
            path: '',
            args: SwapScreenArgs(key: key, primaryToken: primaryToken));

  static const String name = 'SwapScreen';
}

class SwapScreenArgs {
  const SwapScreenArgs({this.key, this.primaryToken});

  final _i36.Key? key;

  final _i42.Token? primaryToken;

  @override
  String toString() {
    return 'SwapScreenArgs{key: $key, primaryToken: $primaryToken}';
  }
}

/// generated route for
/// [_i27.ReviewSwapScreen]
class ReviewSwapScreen extends _i11.PageRouteInfo<ReviewSwapScreenArgs> {
  ReviewSwapScreen(
      {required _i43.TradeInfo tradeInfo,
      required _i43.TradeInfo rateInfo,
      required _i43.SwapRequestBody swapRequestBody})
      : super(ReviewSwapScreen.name,
            path: 'review-swap-screen',
            args: ReviewSwapScreenArgs(
                tradeInfo: tradeInfo,
                rateInfo: rateInfo,
                swapRequestBody: swapRequestBody));

  static const String name = 'ReviewSwapScreen';
}

class ReviewSwapScreenArgs {
  const ReviewSwapScreenArgs(
      {required this.tradeInfo,
      required this.rateInfo,
      required this.swapRequestBody});

  final _i43.TradeInfo tradeInfo;

  final _i43.TradeInfo rateInfo;

  final _i43.SwapRequestBody swapRequestBody;

  @override
  String toString() {
    return 'ReviewSwapScreenArgs{tradeInfo: $tradeInfo, rateInfo: $rateInfo, swapRequestBody: $swapRequestBody}';
  }
}

/// generated route for
/// [_i28.AccountScreen]
class AccountScreen extends _i11.PageRouteInfo<void> {
  const AccountScreen() : super(AccountScreen.name, path: '');

  static const String name = 'AccountScreen';
}

/// generated route for
/// [_i29.ShowMnemonic]
class ShowMnemonic extends _i11.PageRouteInfo<void> {
  const ShowMnemonic() : super(ShowMnemonic.name, path: 'show-mnemonic');

  static const String name = 'ShowMnemonic';
}

/// generated route for
/// [_i30.VerifyMnemonic]
class VerifyMnemonic extends _i11.PageRouteInfo<void> {
  const VerifyMnemonic() : super(VerifyMnemonic.name, path: 'verify-mnemonic');

  static const String name = 'VerifyMnemonic';
}

/// generated route for
/// [_i31.DoneBackup]
class DoneBackup extends _i11.PageRouteInfo<void> {
  const DoneBackup() : super(DoneBackup.name, path: 'done-backup');

  static const String name = 'DoneBackup';
}

/// generated route for
/// [_i32.SettingsScreen]
class SettingsScreen extends _i11.PageRouteInfo<void> {
  const SettingsScreen() : super(SettingsScreen.name, path: 'settings-screen');

  static const String name = 'SettingsScreen';
}

/// generated route for
/// [_i33.ProtectYourWallet]
class ProtectYourWallet extends _i11.PageRouteInfo<void> {
  const ProtectYourWallet()
      : super(ProtectYourWallet.name, path: 'protect-your-wallet');

  static const String name = 'ProtectYourWallet';
}

/// generated route for
/// [_i34.ProfileScreen]
class ProfileScreen extends _i11.PageRouteInfo<ProfileScreenArgs> {
  ProfileScreen({_i36.Key? key})
      : super(ProfileScreen.name,
            path: 'profile-screen', args: ProfileScreenArgs(key: key));

  static const String name = 'ProfileScreen';
}

class ProfileScreenArgs {
  const ProfileScreenArgs({this.key});

  final _i36.Key? key;

  @override
  String toString() {
    return 'ProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i35.SocialScreen]
class SocialScreen extends _i11.PageRouteInfo<void> {
  const SocialScreen() : super(SocialScreen.name, path: 'social-screen');

  static const String name = 'SocialScreen';
}
