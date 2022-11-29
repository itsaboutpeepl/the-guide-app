// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i26;
import 'package:auto_route/empty_router_widgets.dart' as _i12;
import 'package:flutter/material.dart' as _i27;

import '../../features/account/screens/account_screen.dart' as _i17;
import '../../features/account/screens/dAppScreen.dart' as _i24;
import '../../features/account/screens/done_backup_screen.dart' as _i20;
import '../../features/account/screens/profile.dart' as _i23;
import '../../features/account/screens/protect_your_wallet.dart' as _i22;
import '../../features/account/screens/settings.dart' as _i21;
import '../../features/account/screens/show_mnemonic.dart' as _i18;
import '../../features/account/screens/verify_mnemonic.dart' as _i19;
import '../../features/guideHome/screens/guideHome.dart' as _i13;
import '../../features/guideNews/screens/newsScreen.dart' as _i14;
import '../../features/network/screens/networkScreen.dart' as _i25;
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
import '../../features/topup/screens/topup.dart' as _i15;
import '../../features/topup/screens/topup_explained.dart' as _i16;
import 'route_guards.dart' as _i28;

class RootRouter extends _i26.RootStackRouter {
  RootRouter(
      {_i27.GlobalKey<_i27.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i28.AuthGuard authGuard;

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      final args = routeData.argsAs<SplashScreenArgs>(
          orElse: () => const SplashScreenArgs());
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.SplashScreen(
              key: args.key, onLoginResult: args.onLoginResult));
    },
    ChooseSecurityOption.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ChooseSecurityOption());
    },
    PinCodeScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.PinCodeScreen());
    },
    RestoreFromBackupScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RestoreFromBackupScreen());
    },
    OnBoardScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.OnBoardScreen());
    },
    SignUpScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.SignUpScreen());
    },
    VerifyPhoneNumber.name: (routeData) {
      final args = routeData.argsAs<VerifyPhoneNumberArgs>(
          orElse: () => const VerifyPhoneNumberArgs());
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.VerifyPhoneNumber(verificationId: args.verificationId));
    },
    UserNameScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.UserNameScreen());
    },
    Webview.name: (routeData) {
      final args = routeData.argsAs<WebviewArgs>();
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.WebViewScreen(args.url, args.title,
              onPageStarted: args.onPageStarted),
          fullscreenDialog: true);
    },
    MainScreenNoAcc.name: (routeData) {
      final args = routeData.argsAs<MainScreenNoAccArgs>(
          orElse: () => const MainScreenNoAccArgs());
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.MainScreenNoAcc(key: args.key));
    },
    MainScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.MainScreen());
    },
    GuideHomeTab.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    NewsHomeTab.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    GuideHomeScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.GuideHomeScreen());
    },
    NewsHomeScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i14.NewsScreen());
    },
    TopupTab.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    AccountTab.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    NetworkScreenTab.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.EmptyRouterPage());
    },
    TopupScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.TopupScreen());
    },
    TopupExplained.name: (routeData) {
      final args = routeData.argsAs<TopupExplainedArgs>(
          orElse: () => const TopupExplainedArgs());
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i16.TopupExplained(key: args.key));
    },
    AccountScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i17.AccountScreen());
    },
    ShowMnemonic.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.ShowMnemonic());
    },
    VerifyMnemonic.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i19.VerifyMnemonic());
    },
    DoneBackup.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i20.DoneBackup());
    },
    SettingsScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i21.SettingsScreen());
    },
    ProtectYourWallet.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i22.ProtectYourWallet());
    },
    ProfileScreen.name: (routeData) {
      final args = routeData.argsAs<ProfileScreenArgs>(
          orElse: () => const ProfileScreenArgs());
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i23.ProfileScreen(key: args.key));
    },
    DAppScreen.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.DAppScreen());
    },
    NetworkScreen.name: (routeData) {
      final args = routeData.argsAs<NetworkScreenArgs>(
          orElse: () => const NetworkScreenArgs());
      return _i26.CustomPage<dynamic>(
          routeData: routeData,
          child: _i25.NetworkScreen(key: args.key),
          transitionsBuilder: _i26.TransitionsBuilders.slideRightWithFade,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i26.RouteConfig> get routes => [
        _i26.RouteConfig(SplashScreen.name, path: '/'),
        _i26.RouteConfig(ChooseSecurityOption.name,
            path: '/choose-security-option'),
        _i26.RouteConfig(PinCodeScreen.name, path: '/pin-code-screen'),
        _i26.RouteConfig(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen'),
        _i26.RouteConfig(OnBoardScreen.name, path: '/on-board-screen'),
        _i26.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i26.RouteConfig(VerifyPhoneNumber.name, path: '/verify-phone-number'),
        _i26.RouteConfig(UserNameScreen.name, path: '/user-name-screen'),
        _i26.RouteConfig(Webview.name, path: '/web-view-screen'),
        _i26.RouteConfig(MainScreenNoAcc.name,
            path: '/main-screen-no-acc',
            children: [
              _i26.RouteConfig(GuideHomeTab.name,
                  path: 'guideHome',
                  parent: MainScreenNoAcc.name,
                  children: [
                    _i26.RouteConfig(GuideHomeScreen.name,
                        path: '', parent: GuideHomeTab.name)
                  ]),
              _i26.RouteConfig(NewsHomeTab.name,
                  path: 'newsHome',
                  parent: MainScreenNoAcc.name,
                  children: [
                    _i26.RouteConfig(NewsHomeScreen.name,
                        path: '', parent: NewsHomeTab.name)
                  ])
            ]),
        _i26.RouteConfig(MainScreen.name, path: '/main-screen', guards: [
          authGuard
        ], children: [
          _i26.RouteConfig(GuideHomeTab.name,
              path: 'guideHome',
              parent: MainScreen.name,
              children: [
                _i26.RouteConfig(GuideHomeScreen.name,
                    path: '', parent: GuideHomeTab.name)
              ]),
          _i26.RouteConfig(NewsHomeTab.name,
              path: 'newsHome',
              parent: MainScreen.name,
              children: [
                _i26.RouteConfig(NewsHomeScreen.name,
                    path: '', parent: NewsHomeTab.name)
              ]),
          _i26.RouteConfig(TopupTab.name,
              path: 'topup',
              parent: MainScreen.name,
              children: [
                _i26.RouteConfig('#redirect',
                    path: '',
                    parent: TopupTab.name,
                    redirectTo: 'topUp',
                    fullMatch: true),
                _i26.RouteConfig(TopupScreen.name,
                    path: 'topUp', parent: TopupTab.name),
                _i26.RouteConfig(TopupExplained.name,
                    path: 'topup-explained', parent: TopupTab.name)
              ]),
          _i26.RouteConfig(AccountTab.name,
              path: 'account',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i26.RouteConfig(AccountScreen.name,
                    path: '', parent: AccountTab.name, guards: [authGuard]),
                _i26.RouteConfig(ShowMnemonic.name,
                    path: 'show-mnemonic',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i26.RouteConfig(VerifyMnemonic.name,
                    path: 'verify-mnemonic',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i26.RouteConfig(DoneBackup.name,
                    path: 'done-backup',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i26.RouteConfig(SettingsScreen.name,
                    path: 'settings-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i26.RouteConfig(ProtectYourWallet.name,
                    path: 'protect-your-wallet',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i26.RouteConfig(ProfileScreen.name,
                    path: 'profile-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i26.RouteConfig(TopupScreen.name,
                    path: 'topUp',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i26.RouteConfig(DAppScreen.name,
                    path: 'd-app-screen',
                    parent: AccountTab.name,
                    guards: [authGuard])
              ]),
          _i26.RouteConfig(NetworkScreenTab.name,
              path: 'networkScreen',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i26.RouteConfig(NetworkScreen.name,
                    path: '',
                    parent: NetworkScreenTab.name,
                    meta: <String, dynamic>{'hideBottomNav': true},
                    guards: [authGuard])
              ])
        ]),
        _i26.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i26.PageRouteInfo<SplashScreenArgs> {
  SplashScreen({_i27.Key? key, void Function(bool)? onLoginResult})
      : super(SplashScreen.name,
            path: '/',
            args: SplashScreenArgs(key: key, onLoginResult: onLoginResult));

  static const String name = 'SplashScreen';
}

class SplashScreenArgs {
  const SplashScreenArgs({this.key, this.onLoginResult});

  final _i27.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'SplashScreenArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i2.ChooseSecurityOption]
class ChooseSecurityOption extends _i26.PageRouteInfo<void> {
  const ChooseSecurityOption()
      : super(ChooseSecurityOption.name, path: '/choose-security-option');

  static const String name = 'ChooseSecurityOption';
}

/// generated route for
/// [_i3.PinCodeScreen]
class PinCodeScreen extends _i26.PageRouteInfo<void> {
  const PinCodeScreen() : super(PinCodeScreen.name, path: '/pin-code-screen');

  static const String name = 'PinCodeScreen';
}

/// generated route for
/// [_i4.RestoreFromBackupScreen]
class RestoreFromBackupScreen extends _i26.PageRouteInfo<void> {
  const RestoreFromBackupScreen()
      : super(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen');

  static const String name = 'RestoreFromBackupScreen';
}

/// generated route for
/// [_i5.OnBoardScreen]
class OnBoardScreen extends _i26.PageRouteInfo<void> {
  const OnBoardScreen() : super(OnBoardScreen.name, path: '/on-board-screen');

  static const String name = 'OnBoardScreen';
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpScreen extends _i26.PageRouteInfo<void> {
  const SignUpScreen() : super(SignUpScreen.name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i7.VerifyPhoneNumber]
class VerifyPhoneNumber extends _i26.PageRouteInfo<VerifyPhoneNumberArgs> {
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
class UserNameScreen extends _i26.PageRouteInfo<void> {
  const UserNameScreen()
      : super(UserNameScreen.name, path: '/user-name-screen');

  static const String name = 'UserNameScreen';
}

/// generated route for
/// [_i9.WebViewScreen]
class Webview extends _i26.PageRouteInfo<WebviewArgs> {
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
class MainScreenNoAcc extends _i26.PageRouteInfo<MainScreenNoAccArgs> {
  MainScreenNoAcc({_i27.Key? key, List<_i26.PageRouteInfo>? children})
      : super(MainScreenNoAcc.name,
            path: '/main-screen-no-acc',
            args: MainScreenNoAccArgs(key: key),
            initialChildren: children);

  static const String name = 'MainScreenNoAcc';
}

class MainScreenNoAccArgs {
  const MainScreenNoAccArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'MainScreenNoAccArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.MainScreen]
class MainScreen extends _i26.PageRouteInfo<void> {
  const MainScreen({List<_i26.PageRouteInfo>? children})
      : super(MainScreen.name, path: '/main-screen', initialChildren: children);

  static const String name = 'MainScreen';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class GuideHomeTab extends _i26.PageRouteInfo<void> {
  const GuideHomeTab({List<_i26.PageRouteInfo>? children})
      : super(GuideHomeTab.name, path: 'guideHome', initialChildren: children);

  static const String name = 'GuideHomeTab';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class NewsHomeTab extends _i26.PageRouteInfo<void> {
  const NewsHomeTab({List<_i26.PageRouteInfo>? children})
      : super(NewsHomeTab.name, path: 'newsHome', initialChildren: children);

  static const String name = 'NewsHomeTab';
}

/// generated route for
/// [_i13.GuideHomeScreen]
class GuideHomeScreen extends _i26.PageRouteInfo<void> {
  const GuideHomeScreen() : super(GuideHomeScreen.name, path: '');

  static const String name = 'GuideHomeScreen';
}

/// generated route for
/// [_i14.NewsScreen]
class NewsHomeScreen extends _i26.PageRouteInfo<void> {
  const NewsHomeScreen() : super(NewsHomeScreen.name, path: '');

  static const String name = 'NewsHomeScreen';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class TopupTab extends _i26.PageRouteInfo<void> {
  const TopupTab({List<_i26.PageRouteInfo>? children})
      : super(TopupTab.name, path: 'topup', initialChildren: children);

  static const String name = 'TopupTab';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class AccountTab extends _i26.PageRouteInfo<void> {
  const AccountTab({List<_i26.PageRouteInfo>? children})
      : super(AccountTab.name, path: 'account', initialChildren: children);

  static const String name = 'AccountTab';
}

/// generated route for
/// [_i12.EmptyRouterPage]
class NetworkScreenTab extends _i26.PageRouteInfo<void> {
  const NetworkScreenTab({List<_i26.PageRouteInfo>? children})
      : super(NetworkScreenTab.name,
            path: 'networkScreen', initialChildren: children);

  static const String name = 'NetworkScreenTab';
}

/// generated route for
/// [_i15.TopupScreen]
class TopupScreen extends _i26.PageRouteInfo<void> {
  const TopupScreen() : super(TopupScreen.name, path: 'topUp');

  static const String name = 'TopupScreen';
}

/// generated route for
/// [_i16.TopupExplained]
class TopupExplained extends _i26.PageRouteInfo<TopupExplainedArgs> {
  TopupExplained({_i27.Key? key})
      : super(TopupExplained.name,
            path: 'topup-explained', args: TopupExplainedArgs(key: key));

  static const String name = 'TopupExplained';
}

class TopupExplainedArgs {
  const TopupExplainedArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'TopupExplainedArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.AccountScreen]
class AccountScreen extends _i26.PageRouteInfo<void> {
  const AccountScreen() : super(AccountScreen.name, path: '');

  static const String name = 'AccountScreen';
}

/// generated route for
/// [_i18.ShowMnemonic]
class ShowMnemonic extends _i26.PageRouteInfo<void> {
  const ShowMnemonic() : super(ShowMnemonic.name, path: 'show-mnemonic');

  static const String name = 'ShowMnemonic';
}

/// generated route for
/// [_i19.VerifyMnemonic]
class VerifyMnemonic extends _i26.PageRouteInfo<void> {
  const VerifyMnemonic() : super(VerifyMnemonic.name, path: 'verify-mnemonic');

  static const String name = 'VerifyMnemonic';
}

/// generated route for
/// [_i20.DoneBackup]
class DoneBackup extends _i26.PageRouteInfo<void> {
  const DoneBackup() : super(DoneBackup.name, path: 'done-backup');

  static const String name = 'DoneBackup';
}

/// generated route for
/// [_i21.SettingsScreen]
class SettingsScreen extends _i26.PageRouteInfo<void> {
  const SettingsScreen() : super(SettingsScreen.name, path: 'settings-screen');

  static const String name = 'SettingsScreen';
}

/// generated route for
/// [_i22.ProtectYourWallet]
class ProtectYourWallet extends _i26.PageRouteInfo<void> {
  const ProtectYourWallet()
      : super(ProtectYourWallet.name, path: 'protect-your-wallet');

  static const String name = 'ProtectYourWallet';
}

/// generated route for
/// [_i23.ProfileScreen]
class ProfileScreen extends _i26.PageRouteInfo<ProfileScreenArgs> {
  ProfileScreen({_i27.Key? key})
      : super(ProfileScreen.name,
            path: 'profile-screen', args: ProfileScreenArgs(key: key));

  static const String name = 'ProfileScreen';
}

class ProfileScreenArgs {
  const ProfileScreenArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'ProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i24.DAppScreen]
class DAppScreen extends _i26.PageRouteInfo<void> {
  const DAppScreen() : super(DAppScreen.name, path: 'd-app-screen');

  static const String name = 'DAppScreen';
}

/// generated route for
/// [_i25.NetworkScreen]
class NetworkScreen extends _i26.PageRouteInfo<NetworkScreenArgs> {
  NetworkScreen({_i27.Key? key})
      : super(NetworkScreen.name, path: '', args: NetworkScreenArgs(key: key));

  static const String name = 'NetworkScreen';
}

class NetworkScreenArgs {
  const NetworkScreenArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'NetworkScreenArgs{key: $key}';
  }
}
