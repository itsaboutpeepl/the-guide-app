// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i27;
import 'package:auto_route/empty_router_widgets.dart' as _i12;
import 'package:flutter/material.dart' as _i28;

import '../../features/account/screens/account_screen.dart' as _i18;
import '../../features/account/screens/dAppScreen.dart' as _i25;
import '../../features/account/screens/done_backup_screen.dart' as _i21;
import '../../features/account/screens/profile.dart' as _i24;
import '../../features/account/screens/protect_your_wallet.dart' as _i23;
import '../../features/account/screens/settings.dart' as _i22;
import '../../features/account/screens/show_mnemonic.dart' as _i19;
import '../../features/account/screens/verify_mnemonic.dart' as _i20;
import '../../features/guideHome/screens/guideHome.dart' as _i13;
import '../../features/guideHome/widgets/EventsCalendar/events_page.dart'
    as _i14;
import '../../features/guideNews/screens/newsScreen.dart' as _i15;
import '../../features/network/screens/networkScreen.dart' as _i26;
import '../../features/onboard/screens/restore_wallet_screen.dart' as _i4;
import '../../features/onboard/screens/security_screen.dart' as _i2;
import '../../features/onboard/screens/signup_screen.dart' as _i6;
import '../../features/onboard/screens/username_screen.dart' as _i8;
import '../../features/onboard/screens/verify_screen.dart' as _i7;
import '../../features/screens/main_screen.dart' as _i11;
import '../../features/screens/main_screen_no_acc.dart' as _i10;
import '../../features/screens/on_board_screen.dart' as _i5;
import '../../features/screens/pincode_screen.dart' as _i3;
import '../../features/screens/splash_screen.dart' as _i1;
import '../../features/screens/webview_screen.dart' as _i9;
import '../../features/topup/screens/topup.dart' as _i16;
import '../../features/topup/screens/topup_explained.dart' as _i17;
import 'route_guards.dart' as _i29;

class RootRouter extends _i27.RootStackRouter {
  RootRouter(
      {_i28.GlobalKey<_i28.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i29.AuthGuard authGuard;

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      final args = routeData.argsAs<SplashScreenArgs>(
          orElse: () => const SplashScreenArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.SplashScreen(
              key: args.key, onLoginResult: args.onLoginResult));
    },
    ChooseSecurityOption.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ChooseSecurityOption());
    },
    PinCodeScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.PinCodeScreen());
    },
    RestoreFromBackupScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RestoreFromBackupScreen());
    },
    OnBoardScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.OnBoardScreen());
    },
    SignUpScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.SignUpScreen());
    },
    VerifyPhoneNumber.name: (routeData) {
      final args = routeData.argsAs<VerifyPhoneNumberArgs>(
          orElse: () => const VerifyPhoneNumberArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.VerifyPhoneNumber(verificationId: args.verificationId));
    },
    UserNameScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.UserNameScreen());
    },
    Webview.name: (routeData) {
      final args = routeData.argsAs<WebviewArgs>();
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.WebViewScreen(args.url, args.title,
              onPageStarted: args.onPageStarted),
          fullscreenDialog: true);
    },
    MainScreenNoAcc.name: (routeData) {
      final args = routeData.argsAs<MainScreenNoAccArgs>(
          orElse: () => const MainScreenNoAccArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.MainScreenNoAcc(key: args.key));
    },
    MainScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.MainScreen());
    },
    GuideHomeTab.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    NewsHomeTab.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    GuideHomeScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.GuideHomeScreen());
    },
    EventsPage.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.EventsPage());
    },
    NewsHomeScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i15.NewsScreen());
    },
    TopupTab.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    AccountTab.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    NetworkScreenTab.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    TopupScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.TopupScreen());
    },
    TopupExplained.name: (routeData) {
      final args = routeData.argsAs<TopupExplainedArgs>(
          orElse: () => const TopupExplainedArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i17.TopupExplained(key: args.key));
    },
    AccountScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.AccountScreen());
    },
    ShowMnemonic.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i19.ShowMnemonic());
    },
    VerifyMnemonic.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i20.VerifyMnemonic());
    },
    DoneBackup.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i21.DoneBackup());
    },
    SettingsScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i22.SettingsScreen());
    },
    ProtectYourWallet.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i23.ProtectYourWallet());
    },
    ProfileScreen.name: (routeData) {
      final args = routeData.argsAs<ProfileScreenArgs>(
          orElse: () => const ProfileScreenArgs());
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: _i24.ProfileScreen(key: args.key));
    },
    DAppScreen.name: (routeData) {
      return _i27.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.DAppScreen());
    },
    NetworkScreen.name: (routeData) {
      final args = routeData.argsAs<NetworkScreenArgs>(
          orElse: () => const NetworkScreenArgs());
      return _i27.CustomPage<dynamic>(
          routeData: routeData,
          child: _i26.NetworkScreen(key: args.key),
          transitionsBuilder: _i27.TransitionsBuilders.slideRightWithFade,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i27.RouteConfig> get routes => [
        _i27.RouteConfig(SplashScreen.name, path: '/'),
        _i27.RouteConfig(ChooseSecurityOption.name,
            path: '/choose-security-option'),
        _i27.RouteConfig(PinCodeScreen.name, path: '/pin-code-screen'),
        _i27.RouteConfig(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen'),
        _i27.RouteConfig(OnBoardScreen.name, path: '/on-board-screen'),
        _i27.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i27.RouteConfig(VerifyPhoneNumber.name, path: '/verify-phone-number'),
        _i27.RouteConfig(UserNameScreen.name, path: '/user-name-screen'),
        _i27.RouteConfig(Webview.name, path: '/web-view-screen'),
        _i27.RouteConfig(MainScreenNoAcc.name,
            path: '/main-screen-no-acc',
            children: [
              _i27.RouteConfig(GuideHomeTab.name,
                  path: 'guideHome',
                  parent: MainScreenNoAcc.name,
                  children: [
                    _i27.RouteConfig(GuideHomeScreen.name,
                        path: '', parent: GuideHomeTab.name),
                    _i27.RouteConfig(EventsPage.name,
                        path: 'events-page', parent: GuideHomeTab.name)
                  ]),
              _i27.RouteConfig(NewsHomeTab.name,
                  path: 'newsHome',
                  parent: MainScreenNoAcc.name,
                  children: [
                    _i27.RouteConfig(NewsHomeScreen.name,
                        path: '', parent: NewsHomeTab.name)
                  ])
            ]),
        _i27.RouteConfig(MainScreen.name, path: '/main-screen', guards: [
          authGuard
        ], children: [
          _i27.RouteConfig(GuideHomeTab.name,
              path: 'guideHome',
              parent: MainScreen.name,
              children: [
                _i27.RouteConfig(GuideHomeScreen.name,
                    path: '', parent: GuideHomeTab.name),
                _i27.RouteConfig(EventsPage.name,
                    path: 'events-page', parent: GuideHomeTab.name)
              ]),
          _i27.RouteConfig(NewsHomeTab.name,
              path: 'newsHome',
              parent: MainScreen.name,
              children: [
                _i27.RouteConfig(NewsHomeScreen.name,
                    path: '', parent: NewsHomeTab.name)
              ]),
          _i27.RouteConfig(TopupTab.name,
              path: 'topup',
              parent: MainScreen.name,
              children: [
                _i27.RouteConfig('#redirect',
                    path: '',
                    parent: TopupTab.name,
                    redirectTo: 'topUp',
                    fullMatch: true),
                _i27.RouteConfig(TopupScreen.name,
                    path: 'topUp', parent: TopupTab.name),
                _i27.RouteConfig(TopupExplained.name,
                    path: 'topup-explained', parent: TopupTab.name)
              ]),
          _i27.RouteConfig(AccountTab.name,
              path: 'account',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i27.RouteConfig(AccountScreen.name,
                    path: '', parent: AccountTab.name, guards: [authGuard]),
                _i27.RouteConfig(ShowMnemonic.name,
                    path: 'show-mnemonic',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i27.RouteConfig(VerifyMnemonic.name,
                    path: 'verify-mnemonic',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i27.RouteConfig(DoneBackup.name,
                    path: 'done-backup',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i27.RouteConfig(SettingsScreen.name,
                    path: 'settings-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i27.RouteConfig(ProtectYourWallet.name,
                    path: 'protect-your-wallet',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i27.RouteConfig(ProfileScreen.name,
                    path: 'profile-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i27.RouteConfig(TopupScreen.name,
                    path: 'topUp',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i27.RouteConfig(DAppScreen.name,
                    path: 'd-app-screen',
                    parent: AccountTab.name,
                    guards: [authGuard])
              ]),
          _i27.RouteConfig(NetworkScreenTab.name,
              path: 'networkScreen',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i27.RouteConfig(NetworkScreen.name,
                    path: '',
                    parent: NetworkScreenTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true},
                    guards: [authGuard])
              ])
        ]),
        _i27.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i27.PageRouteInfo<SplashScreenArgs> {
  SplashScreen({_i28.Key? key, void Function(bool)? onLoginResult})
      : super(SplashScreen.name,
            path: '/',
            args: SplashScreenArgs(key: key, onLoginResult: onLoginResult));

  static const String name = 'SplashScreen';
}

class SplashScreenArgs {
  const SplashScreenArgs({this.key, this.onLoginResult});

  final _i28.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'SplashScreenArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i2.ChooseSecurityOption]
class ChooseSecurityOption extends _i27.PageRouteInfo<void> {
  const ChooseSecurityOption()
      : super(ChooseSecurityOption.name, path: '/choose-security-option');

  static const String name = 'ChooseSecurityOption';
}

/// generated route for
/// [_i3.PinCodeScreen]
class PinCodeScreen extends _i27.PageRouteInfo<void> {
  const PinCodeScreen() : super(PinCodeScreen.name, path: '/pin-code-screen');

  static const String name = 'PinCodeScreen';
}

/// generated route for
/// [_i4.RestoreFromBackupScreen]
class RestoreFromBackupScreen extends _i27.PageRouteInfo<void> {
  const RestoreFromBackupScreen()
      : super(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen');

  static const String name = 'RestoreFromBackupScreen';
}

/// generated route for
/// [_i5.OnBoardScreen]
class OnBoardScreen extends _i27.PageRouteInfo<void> {
  const OnBoardScreen() : super(OnBoardScreen.name, path: '/on-board-screen');

  static const String name = 'OnBoardScreen';
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreen extends _i27.PageRouteInfo<void> {
  const SignUpScreen() : super(SignUpScreen.name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i7.VerifyPhoneNumber]
class VerifyPhoneNumber extends _i27.PageRouteInfo<VerifyPhoneNumberArgs> {
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
class UserNameScreen extends _i27.PageRouteInfo<void> {
  const UserNameScreen()
      : super(UserNameScreen.name, path: '/user-name-screen');

  static const String name = 'UserNameScreen';
}

/// generated route for
/// [_i9.WebViewScreen]
class Webview extends _i27.PageRouteInfo<WebviewArgs> {
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
/// [_i10.MainScreenNoAcc]
class MainScreenNoAcc extends _i27.PageRouteInfo<MainScreenNoAccArgs> {
  MainScreenNoAcc({_i28.Key? key, List<_i27.PageRouteInfo>? children})
      : super(MainScreenNoAcc.name,
            path: '/main-screen-no-acc',
            args: MainScreenNoAccArgs(key: key),
            initialChildren: children);

  static const String name = 'MainScreenNoAcc';
}

class MainScreenNoAccArgs {
  const MainScreenNoAccArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'MainScreenNoAccArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.MainScreen]
class MainScreen extends _i27.PageRouteInfo<void> {
  const MainScreen({List<_i27.PageRouteInfo>? children})
      : super(MainScreen.name, path: '/main-screen', initialChildren: children);

  static const String name = 'MainScreen';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class GuideHomeTab extends _i27.PageRouteInfo<void> {
  const GuideHomeTab({List<_i27.PageRouteInfo>? children})
      : super(GuideHomeTab.name, path: 'guideHome', initialChildren: children);

  static const String name = 'GuideHomeTab';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class NewsHomeTab extends _i27.PageRouteInfo<void> {
  const NewsHomeTab({List<_i27.PageRouteInfo>? children})
      : super(NewsHomeTab.name, path: 'newsHome', initialChildren: children);

  static const String name = 'NewsHomeTab';
}

/// generated route for
/// [_i13.GuideHomeScreen]
class GuideHomeScreen extends _i27.PageRouteInfo<void> {
  const GuideHomeScreen() : super(GuideHomeScreen.name, path: '');

  static const String name = 'GuideHomeScreen';
}

/// generated route for
/// [_i14.EventsPage]
class EventsPage extends _i27.PageRouteInfo<void> {
  const EventsPage() : super(EventsPage.name, path: 'events-page');

  static const String name = 'EventsPage';
}

/// generated route for
/// [_i15.NewsScreen]
class NewsHomeScreen extends _i27.PageRouteInfo<void> {
  const NewsHomeScreen() : super(NewsHomeScreen.name, path: '');

  static const String name = 'NewsHomeScreen';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class TopupTab extends _i27.PageRouteInfo<void> {
  const TopupTab({List<_i27.PageRouteInfo>? children})
      : super(TopupTab.name, path: 'topup', initialChildren: children);

  static const String name = 'TopupTab';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class AccountTab extends _i27.PageRouteInfo<void> {
  const AccountTab({List<_i27.PageRouteInfo>? children})
      : super(AccountTab.name, path: 'account', initialChildren: children);

  static const String name = 'AccountTab';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class NetworkScreenTab extends _i27.PageRouteInfo<void> {
  const NetworkScreenTab({List<_i27.PageRouteInfo>? children})
      : super(NetworkScreenTab.name,
            path: 'networkScreen', initialChildren: children);

  static const String name = 'NetworkScreenTab';
}

/// generated route for
/// [_i16.TopupScreen]
class TopupScreen extends _i27.PageRouteInfo<void> {
  const TopupScreen() : super(TopupScreen.name, path: 'topUp');

  static const String name = 'TopupScreen';
}

/// generated route for
/// [_i17.TopupExplained]
class TopupExplained extends _i27.PageRouteInfo<TopupExplainedArgs> {
  TopupExplained({_i28.Key? key})
      : super(TopupExplained.name,
            path: 'topup-explained', args: TopupExplainedArgs(key: key));

  static const String name = 'TopupExplained';
}

class TopupExplainedArgs {
  const TopupExplainedArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'TopupExplainedArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.AccountScreen]
class AccountScreen extends _i27.PageRouteInfo<void> {
  const AccountScreen() : super(AccountScreen.name, path: '');

  static const String name = 'AccountScreen';
}

/// generated route for
/// [_i19.ShowMnemonic]
class ShowMnemonic extends _i27.PageRouteInfo<void> {
  const ShowMnemonic() : super(ShowMnemonic.name, path: 'show-mnemonic');

  static const String name = 'ShowMnemonic';
}

/// generated route for
/// [_i20.VerifyMnemonic]
class VerifyMnemonic extends _i27.PageRouteInfo<void> {
  const VerifyMnemonic() : super(VerifyMnemonic.name, path: 'verify-mnemonic');

  static const String name = 'VerifyMnemonic';
}

/// generated route for
/// [_i21.DoneBackup]
class DoneBackup extends _i27.PageRouteInfo<void> {
  const DoneBackup() : super(DoneBackup.name, path: 'done-backup');

  static const String name = 'DoneBackup';
}

/// generated route for
/// [_i22.SettingsScreen]
class SettingsScreen extends _i27.PageRouteInfo<void> {
  const SettingsScreen() : super(SettingsScreen.name, path: 'settings-screen');

  static const String name = 'SettingsScreen';
}

/// generated route for
/// [_i23.ProtectYourWallet]
class ProtectYourWallet extends _i27.PageRouteInfo<void> {
  const ProtectYourWallet()
      : super(ProtectYourWallet.name, path: 'protect-your-wallet');

  static const String name = 'ProtectYourWallet';
}

/// generated route for
/// [_i24.ProfileScreen]
class ProfileScreen extends _i27.PageRouteInfo<ProfileScreenArgs> {
  ProfileScreen({_i28.Key? key})
      : super(ProfileScreen.name,
            path: 'profile-screen', args: ProfileScreenArgs(key: key));

  static const String name = 'ProfileScreen';
}

class ProfileScreenArgs {
  const ProfileScreenArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'ProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i25.DAppScreen]
class DAppScreen extends _i27.PageRouteInfo<void> {
  const DAppScreen() : super(DAppScreen.name, path: 'd-app-screen');

  static const String name = 'DAppScreen';
}

/// generated route for
/// [_i26.NetworkScreen]
class NetworkScreen extends _i27.PageRouteInfo<NetworkScreenArgs> {
  NetworkScreen({_i28.Key? key})
      : super(NetworkScreen.name, path: '', args: NetworkScreenArgs(key: key));

  static const String name = 'NetworkScreen';
}

class NetworkScreenArgs {
  const NetworkScreenArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'NetworkScreenArgs{key: $key}';
  }
}
