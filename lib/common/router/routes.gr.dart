// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;
import 'package:guide_liverpool/features/account/screens/account_screen.dart'
    as _i18;
import 'package:guide_liverpool/features/account/screens/done_backup_screen.dart'
    as _i20;
import 'package:guide_liverpool/features/account/screens/profile.dart' as _i17;
import 'package:guide_liverpool/features/account/screens/protect_your_wallet.dart'
    as _i22;
import 'package:guide_liverpool/features/account/screens/settings.dart' as _i23;
import 'package:guide_liverpool/features/account/screens/show_mnemonic.dart'
    as _i21;
import 'package:guide_liverpool/features/account/screens/verify_mnemonic.dart'
    as _i19;
import 'package:guide_liverpool/features/guideHome/screens/guideHome.dart'
    as _i1;
import 'package:guide_liverpool/features/guideHome/widgets/EventsCalendar/events_page.dart'
    as _i2;
import 'package:guide_liverpool/features/guideNews/screens/newsScreen.dart'
    as _i16;
import 'package:guide_liverpool/features/network/screens/networkScreen.dart'
    as _i4;
import 'package:guide_liverpool/features/onboard/screens/restore_wallet_screen.dart'
    as _i9;
import 'package:guide_liverpool/features/onboard/screens/security_screen.dart'
    as _i5;
import 'package:guide_liverpool/features/onboard/screens/signup_screen.dart'
    as _i8;
import 'package:guide_liverpool/features/onboard/screens/username_screen.dart'
    as _i7;
import 'package:guide_liverpool/features/onboard/screens/verify_screen.dart'
    as _i6;
import 'package:guide_liverpool/features/screens/main_screen.dart' as _i14;
import 'package:guide_liverpool/features/screens/main_screen_no_acc.dart'
    as _i12;
import 'package:guide_liverpool/features/screens/on_board_screen.dart' as _i11;
import 'package:guide_liverpool/features/screens/pincode_screen.dart' as _i10;
import 'package:guide_liverpool/features/screens/splash_screen.dart' as _i15;
import 'package:guide_liverpool/features/screens/webview_screen.dart' as _i13;
import 'package:guide_liverpool/features/topup/screens/topup.dart' as _i3;

abstract class $RootRouter extends _i24.RootStackRouter {
  $RootRouter([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    EventsRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EventsPage(),
      );
    },
    TopupRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.TopupPage(),
      );
    },
    NetworkRoute.name: (routeData) {
      final args = routeData.argsAs<NetworkRouteArgs>(
          orElse: () => const NetworkRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.NetworkPage(key: args.key),
      );
    },
    SecurityOptionRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SecurityOptionPage(),
      );
    },
    VerifyPhoneRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyPhoneRouteArgs>(
          orElse: () => const VerifyPhoneRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.VerifyPhonePage(verificationId: args.verificationId),
      );
    },
    SelectUsernameRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SelectUsernamePage(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SignupPage(),
      );
    },
    RestoreFromBackupRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.RestoreFromBackupPage(),
      );
    },
    PincodeRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.PincodePage(),
      );
    },
    OnboardRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.OnboardPage(),
      );
    },
    MainRouteNoAccRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteNoAccRouteArgs>(
          orElse: () => const MainRouteNoAccRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.MainScreenNoAccPage(key: args.key),
      );
    },
    WebViewRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewRouteArgs>();
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WebViewPage(
          args.url,
          args.title,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.MainPage(),
      );
    },
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>(
          orElse: () => const SplashRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.SplashPage(
          key: args.key,
          onLoginResult: args.onLoginResult,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.NewsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>(
          orElse: () => const ProfileRouteArgs());
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.ProfilePage(key: args.key),
      );
    },
    AccountRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.AccountPage(),
      );
    },
    VerifyMnemonicRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.VerifyMnemonicPage(),
      );
    },
    BackupCompletedRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.BackupCompletedPage(),
      );
    },
    MnemonicRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.MnemonicPage(),
      );
    },
    ProtectWalletRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.ProtectWalletPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i24.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EventsPage]
class EventsRoute extends _i24.PageRouteInfo<void> {
  const EventsRoute({List<_i24.PageRouteInfo>? children})
      : super(
          EventsRoute.name,
          initialChildren: children,
        );

  static const String name = 'EventsRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i3.TopupPage]
class TopupRoute extends _i24.PageRouteInfo<void> {
  const TopupRoute({List<_i24.PageRouteInfo>? children})
      : super(
          TopupRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopupRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NetworkPage]
class NetworkRoute extends _i24.PageRouteInfo<NetworkRouteArgs> {
  NetworkRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          NetworkRoute.name,
          args: NetworkRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NetworkRoute';

  static const _i24.PageInfo<NetworkRouteArgs> page =
      _i24.PageInfo<NetworkRouteArgs>(name);
}

class NetworkRouteArgs {
  const NetworkRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'NetworkRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SecurityOptionPage]
class SecurityOptionRoute extends _i24.PageRouteInfo<void> {
  const SecurityOptionRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SecurityOptionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecurityOptionRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i6.VerifyPhonePage]
class VerifyPhoneRoute extends _i24.PageRouteInfo<VerifyPhoneRouteArgs> {
  VerifyPhoneRoute({
    String? verificationId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          VerifyPhoneRoute.name,
          args: VerifyPhoneRouteArgs(verificationId: verificationId),
          initialChildren: children,
        );

  static const String name = 'VerifyPhoneRoute';

  static const _i24.PageInfo<VerifyPhoneRouteArgs> page =
      _i24.PageInfo<VerifyPhoneRouteArgs>(name);
}

class VerifyPhoneRouteArgs {
  const VerifyPhoneRouteArgs({this.verificationId});

  final String? verificationId;

  @override
  String toString() {
    return 'VerifyPhoneRouteArgs{verificationId: $verificationId}';
  }
}

/// generated route for
/// [_i7.SelectUsernamePage]
class SelectUsernameRoute extends _i24.PageRouteInfo<void> {
  const SelectUsernameRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SelectUsernameRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectUsernameRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignupPage]
class SignupRoute extends _i24.PageRouteInfo<void> {
  const SignupRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RestoreFromBackupPage]
class RestoreFromBackupRoute extends _i24.PageRouteInfo<void> {
  const RestoreFromBackupRoute({List<_i24.PageRouteInfo>? children})
      : super(
          RestoreFromBackupRoute.name,
          initialChildren: children,
        );

  static const String name = 'RestoreFromBackupRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PincodePage]
class PincodeRoute extends _i24.PageRouteInfo<void> {
  const PincodeRoute({List<_i24.PageRouteInfo>? children})
      : super(
          PincodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PincodeRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OnboardPage]
class OnboardRoute extends _i24.PageRouteInfo<void> {
  const OnboardRoute({List<_i24.PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MainScreenNoAccPage]
class MainRouteNoAccRoute extends _i24.PageRouteInfo<MainRouteNoAccRouteArgs> {
  MainRouteNoAccRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          MainRouteNoAccRoute.name,
          args: MainRouteNoAccRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRouteNoAccRoute';

  static const _i24.PageInfo<MainRouteNoAccRouteArgs> page =
      _i24.PageInfo<MainRouteNoAccRouteArgs>(name);
}

class MainRouteNoAccRouteArgs {
  const MainRouteNoAccRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'MainRouteNoAccRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.WebViewPage]
class WebViewRoute extends _i24.PageRouteInfo<WebViewRouteArgs> {
  WebViewRoute({
    required String url,
    required String title,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          WebViewRoute.name,
          args: WebViewRouteArgs(
            url: url,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'WebViewRoute';

  static const _i24.PageInfo<WebViewRouteArgs> page =
      _i24.PageInfo<WebViewRouteArgs>(name);
}

class WebViewRouteArgs {
  const WebViewRouteArgs({
    required this.url,
    required this.title,
  });

  final String url;

  final String title;

  @override
  String toString() {
    return 'WebViewRouteArgs{url: $url, title: $title}';
  }
}

/// generated route for
/// [_i14.MainPage]
class MainRoute extends _i24.PageRouteInfo<void> {
  const MainRoute({List<_i24.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i15.SplashPage]
class SplashRoute extends _i24.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({
    _i25.Key? key,
    void Function(bool)? onLoginResult,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          SplashRoute.name,
          args: SplashRouteArgs(
            key: key,
            onLoginResult: onLoginResult,
          ),
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i24.PageInfo<SplashRouteArgs> page =
      _i24.PageInfo<SplashRouteArgs>(name);
}

class SplashRouteArgs {
  const SplashRouteArgs({
    this.key,
    this.onLoginResult,
  });

  final _i25.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i16.NewsPage]
class NewsRoute extends _i24.PageRouteInfo<void> {
  const NewsRoute({List<_i24.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i17.ProfilePage]
class ProfileRoute extends _i24.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    _i25.Key? key,
    List<_i24.PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i24.PageInfo<ProfileRouteArgs> page =
      _i24.PageInfo<ProfileRouteArgs>(name);
}

class ProfileRouteArgs {
  const ProfileRouteArgs({this.key});

  final _i25.Key? key;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.AccountPage]
class AccountRoute extends _i24.PageRouteInfo<void> {
  const AccountRoute({List<_i24.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i19.VerifyMnemonicPage]
class VerifyMnemonicRoute extends _i24.PageRouteInfo<void> {
  const VerifyMnemonicRoute({List<_i24.PageRouteInfo>? children})
      : super(
          VerifyMnemonicRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyMnemonicRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i20.BackupCompletedPage]
class BackupCompletedRoute extends _i24.PageRouteInfo<void> {
  const BackupCompletedRoute({List<_i24.PageRouteInfo>? children})
      : super(
          BackupCompletedRoute.name,
          initialChildren: children,
        );

  static const String name = 'BackupCompletedRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i21.MnemonicPage]
class MnemonicRoute extends _i24.PageRouteInfo<void> {
  const MnemonicRoute({List<_i24.PageRouteInfo>? children})
      : super(
          MnemonicRoute.name,
          initialChildren: children,
        );

  static const String name = 'MnemonicRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ProtectWalletPage]
class ProtectWalletRoute extends _i24.PageRouteInfo<void> {
  const ProtectWalletRoute({List<_i24.PageRouteInfo>? children})
      : super(
          ProtectWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProtectWalletRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SettingsPage]
class SettingsRoute extends _i24.PageRouteInfo<void> {
  const SettingsRoute({List<_i24.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i24.PageInfo<void> page = _i24.PageInfo<void>(name);
}
