// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:contacts_service/contacts_service.dart' as _i38;
import 'package:flutter/material.dart' as _i35;

import '../../features/account/screens/account_screen.dart' as _i26;
import '../../features/account/screens/done_backup_screen.dart' as _i29;
import '../../features/account/screens/profile.dart' as _i32;
import '../../features/account/screens/protect_your_wallet.dart' as _i31;
import '../../features/account/screens/settings.dart' as _i30;
import '../../features/account/screens/show_mnemonic.dart' as _i27;
import '../../features/account/screens/social_screen.dart' as _i33;
import '../../features/account/screens/verify_mnemonic.dart' as _i28;
import '../../features/buy/screens/business.dart' as _i25;
import '../../features/buy/screens/buy.dart' as _i24;
import '../../features/contacts/screens/contacts_list.dart' as _i20;
import '../../features/contacts/screens/send_amount.dart' as _i21;
import '../../features/contacts/screens/send_review.dart' as _i22;
import '../../features/contacts/screens/send_success.dart' as _i23;
import '../../features/contacts/send_amount_arguments.dart' as _i39;
import '../../features/guideHome/screens/guideHome.dart' as _i14;
import '../../features/guideNews/screens/newsScreen.dart' as _i15;
import '../../features/home/screens/action_details.dart' as _i17;
import '../../features/home/screens/home.dart' as _i16;
import '../../features/onboard/screens/restore_wallet_screen.dart' as _i6;
import '../../features/onboard/screens/security_screen.dart' as _i2;
import '../../features/onboard/screens/show_user_mnemonic.dart' as _i4;
import '../../features/onboard/screens/signup_screen.dart' as _i8;
import '../../features/onboard/screens/username_screen.dart' as _i10;
import '../../features/onboard/screens/verify_screen.dart' as _i9;
import '../../features/onboard/screens/verify_user_mnemonic.dart' as _i5;
import '../../features/screens/main_screen.dart' as _i12;
import '../../features/screens/on_board_screen.dart' as _i7;
import '../../features/screens/pincode_screen.dart' as _i3;
import '../../features/screens/splash_screen.dart' as _i1;
import '../../features/screens/webview_screen.dart' as _i11;
import '../../features/topup/screens/topup.dart' as _i18;
import '../../features/topup/screens/topup_explained.dart' as _i19;
import '../../features/webview/webviewScreen.dart' as _i34;
import '../../models/actions/wallet_action.dart' as _i37;
import '../../models/community/business.dart' as _i40;
import '../../models/tokens/token.dart' as _i41;
import 'route_guards.dart' as _i36;

class RootRouter extends _i13.RootStackRouter {
  RootRouter(
      {_i35.GlobalKey<_i35.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i36.AuthGuard authGuard;

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      final args = routeData.argsAs<SplashScreenArgs>(
          orElse: () => const SplashScreenArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.SplashScreen(
              key: args.key, onLoginResult: args.onLoginResult));
    },
    ChooseSecurityOption.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.ChooseSecurityOption());
    },
    PinCodeScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.PinCodeScreen());
    },
    ShowUserMnemonicScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ShowUserMnemonicScreen());
    },
    VerifyUserMnemonic.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.VerifyUserMnemonic());
    },
    RestoreFromBackupScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.RestoreFromBackupScreen());
    },
    OnBoardScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.OnBoardScreen());
    },
    SignUpScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.SignUpScreen());
    },
    VerifyPhoneNumber.name: (routeData) {
      final args = routeData.argsAs<VerifyPhoneNumberArgs>(
          orElse: () => const VerifyPhoneNumberArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.VerifyPhoneNumber(verificationId: args.verificationId));
    },
    UserNameScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.UserNameScreen());
    },
    Webview.name: (routeData) {
      final args = routeData.argsAs<WebviewArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.WebViewScreen(args.url, args.title,
              onPageStarted: args.onPageStarted),
          fullscreenDialog: true);
    },
    MainScreen.name: (routeData) {
      final args = routeData.argsAs<MainScreenArgs>(
          orElse: () => const MainScreenArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i12.MainScreen(key: args.key));
    },
    GuideHomeTab.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.EmptyRouterPage());
    },
    NewsHomeTab.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.EmptyRouterPage());
    },
    HomeTab.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.EmptyRouterPage());
    },
    TopupTab.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.EmptyRouterPage());
    },
    ContactsTab.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.EmptyRouterPage());
    },
    BuyTab.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.EmptyRouterPage());
    },
    AccountTab.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.EmptyRouterPage());
    },
    WebviewTab.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.EmptyRouterPage());
    },
    GuideHomeScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.GuideHomeScreen());
    },
    NewsHomeScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i15.NewsScreen());
    },
    HomeScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.HomeScreen());
    },
    ActionDetailsScreen.name: (routeData) {
      final args = routeData.argsAs<ActionDetailsScreenArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i17.ActionDetailsScreen(
              action: args.action,
              image: args.image,
              displayName: args.displayName,
              accountAddress: args.accountAddress,
              symbol: args.symbol,
              contact: args.contact));
    },
    TopupScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.TopupScreen());
    },
    TopupExplained.name: (routeData) {
      final args = routeData.argsAs<TopupExplainedArgs>(
          orElse: () => const TopupExplainedArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i19.TopupExplained(key: args.key));
    },
    ContactsList.name: (routeData) {
      final args = routeData.argsAs<ContactsListArgs>(
          orElse: () => const ContactsListArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i20.ContactsList(pageArgs: args.pageArgs));
    },
    SendAmountScreen.name: (routeData) {
      final args = routeData.argsAs<SendAmountScreenArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i21.SendAmountScreen(pageArgs: args.pageArgs));
    },
    SendReviewScreen.name: (routeData) {
      final args = routeData.argsAs<SendReviewScreenArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i22.SendReviewScreen(pageArgs: args.pageArgs));
    },
    SendSuccessScreen.name: (routeData) {
      final args = routeData.argsAs<SendSuccessScreenArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i23.SendSuccessScreen(pageArgs: args.pageArgs));
    },
    BuyScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i24.BuyScreen());
    },
    BusinessScreen.name: (routeData) {
      final args = routeData.argsAs<BusinessScreenArgs>();
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i25.BusinessScreen(business: args.business, token: args.token));
    },
    AccountScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i26.AccountScreen());
    },
    ShowMnemonic.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i27.ShowMnemonic());
    },
    VerifyMnemonic.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i28.VerifyMnemonic());
    },
    DoneBackup.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i29.DoneBackup());
    },
    SettingsScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i30.SettingsScreen());
    },
    ProtectYourWallet.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i31.ProtectYourWallet());
    },
    ProfileScreen.name: (routeData) {
      final args = routeData.argsAs<ProfileScreenArgs>(
          orElse: () => const ProfileScreenArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i32.ProfileScreen(key: args.key));
    },
    SocialScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: _i33.SocialScreen());
    },
    WebViewScreen.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i34.WebviewScreen());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(SplashScreen.name, path: '/'),
        _i13.RouteConfig(ChooseSecurityOption.name,
            path: '/choose-security-option'),
        _i13.RouteConfig(PinCodeScreen.name, path: '/pin-code-screen'),
        _i13.RouteConfig(ShowUserMnemonicScreen.name,
            path: '/show-user-mnemonic-screen'),
        _i13.RouteConfig(VerifyUserMnemonic.name,
            path: '/verify-user-mnemonic'),
        _i13.RouteConfig(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen'),
        _i13.RouteConfig(OnBoardScreen.name, path: '/on-board-screen'),
        _i13.RouteConfig(SignUpScreen.name, path: '/sign-up-screen'),
        _i13.RouteConfig(VerifyPhoneNumber.name, path: '/verify-phone-number'),
        _i13.RouteConfig(UserNameScreen.name, path: '/user-name-screen'),
        _i13.RouteConfig(Webview.name, path: '/web-view-screen'),
        _i13.RouteConfig(MainScreen.name, path: '/main-screen', guards: [
          authGuard
        ], children: [
          _i13.RouteConfig(GuideHomeTab.name,
              path: 'guideHome',
              parent: MainScreen.name,
              children: [
                _i13.RouteConfig(GuideHomeScreen.name,
                    path: '', parent: GuideHomeTab.name, guards: [authGuard])
              ]),
          _i13.RouteConfig(NewsHomeTab.name,
              path: 'newsHome',
              parent: MainScreen.name,
              children: [
                _i13.RouteConfig(NewsHomeScreen.name,
                    path: '', parent: NewsHomeTab.name, guards: [authGuard])
              ]),
          _i13.RouteConfig(HomeTab.name,
              path: 'home',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i13.RouteConfig(HomeScreen.name,
                    path: '', parent: HomeTab.name, guards: [authGuard]),
                _i13.RouteConfig(ActionDetailsScreen.name,
                    path: 'action-details-screen',
                    parent: HomeTab.name,
                    guards: [authGuard])
              ]),
          _i13.RouteConfig(TopupTab.name,
              path: 'topup',
              parent: MainScreen.name,
              children: [
                _i13.RouteConfig('#redirect',
                    path: '',
                    parent: TopupTab.name,
                    redirectTo: 'topUp',
                    fullMatch: true),
                _i13.RouteConfig(TopupScreen.name,
                    path: 'topUp', parent: TopupTab.name),
                _i13.RouteConfig(TopupExplained.name,
                    path: 'topup-explained', parent: TopupTab.name)
              ]),
          _i13.RouteConfig(ContactsTab.name,
              path: 'contacts',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i13.RouteConfig(ContactsList.name,
                    path: '', parent: ContactsTab.name, guards: [authGuard]),
                _i13.RouteConfig(SendAmountScreen.name,
                    path: 'send-amount',
                    parent: ContactsTab.name,
                    guards: [authGuard]),
                _i13.RouteConfig(SendReviewScreen.name,
                    path: 'send-review',
                    parent: ContactsTab.name,
                    guards: [authGuard]),
                _i13.RouteConfig(SendSuccessScreen.name,
                    path: 'send-success',
                    parent: ContactsTab.name,
                    guards: [authGuard])
              ]),
          _i13.RouteConfig(BuyTab.name,
              path: 'buy',
              parent: MainScreen.name,
              children: [
                _i13.RouteConfig(BuyScreen.name, path: '', parent: BuyTab.name),
                _i13.RouteConfig(BusinessScreen.name,
                    path: 'business-screen', parent: BuyTab.name)
              ]),
          _i13.RouteConfig(AccountTab.name,
              path: 'account',
              parent: MainScreen.name,
              guards: [
                authGuard
              ],
              children: [
                _i13.RouteConfig(AccountScreen.name,
                    path: '', parent: AccountTab.name, guards: [authGuard]),
                _i13.RouteConfig(ShowMnemonic.name,
                    path: 'show-mnemonic',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i13.RouteConfig(VerifyMnemonic.name,
                    path: 'verify-mnemonic',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i13.RouteConfig(DoneBackup.name,
                    path: 'done-backup',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i13.RouteConfig(SettingsScreen.name,
                    path: 'settings-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i13.RouteConfig(ProtectYourWallet.name,
                    path: 'protect-your-wallet',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i13.RouteConfig(ProfileScreen.name,
                    path: 'profile-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i13.RouteConfig(SocialScreen.name,
                    path: 'social-screen',
                    parent: AccountTab.name,
                    guards: [authGuard]),
                _i13.RouteConfig(TopupScreen.name,
                    path: 'topUp', parent: AccountTab.name, guards: [authGuard])
              ]),
          _i13.RouteConfig(WebviewTab.name,
              path: 'webview',
              parent: MainScreen.name,
              children: [
                _i13.RouteConfig(WebViewScreen.name,
                    path: '', parent: WebviewTab.name, guards: [authGuard])
              ])
        ]),
        _i13.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i13.PageRouteInfo<SplashScreenArgs> {
  SplashScreen({_i35.Key? key, void Function(bool)? onLoginResult})
      : super(SplashScreen.name,
            path: '/',
            args: SplashScreenArgs(key: key, onLoginResult: onLoginResult));

  static const String name = 'SplashScreen';
}

class SplashScreenArgs {
  const SplashScreenArgs({this.key, this.onLoginResult});

  final _i35.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'SplashScreenArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i2.ChooseSecurityOption]
class ChooseSecurityOption extends _i13.PageRouteInfo<void> {
  const ChooseSecurityOption()
      : super(ChooseSecurityOption.name, path: '/choose-security-option');

  static const String name = 'ChooseSecurityOption';
}

/// generated route for
/// [_i3.PinCodeScreen]
class PinCodeScreen extends _i13.PageRouteInfo<void> {
  const PinCodeScreen() : super(PinCodeScreen.name, path: '/pin-code-screen');

  static const String name = 'PinCodeScreen';
}

/// generated route for
/// [_i4.ShowUserMnemonicScreen]
class ShowUserMnemonicScreen extends _i13.PageRouteInfo<void> {
  const ShowUserMnemonicScreen()
      : super(ShowUserMnemonicScreen.name, path: '/show-user-mnemonic-screen');

  static const String name = 'ShowUserMnemonicScreen';
}

/// generated route for
/// [_i5.VerifyUserMnemonic]
class VerifyUserMnemonic extends _i13.PageRouteInfo<void> {
  const VerifyUserMnemonic()
      : super(VerifyUserMnemonic.name, path: '/verify-user-mnemonic');

  static const String name = 'VerifyUserMnemonic';
}

/// generated route for
/// [_i6.RestoreFromBackupScreen]
class RestoreFromBackupScreen extends _i13.PageRouteInfo<void> {
  const RestoreFromBackupScreen()
      : super(RestoreFromBackupScreen.name,
            path: '/restore-from-backup-screen');

  static const String name = 'RestoreFromBackupScreen';
}

/// generated route for
/// [_i7.OnBoardScreen]
class OnBoardScreen extends _i13.PageRouteInfo<void> {
  const OnBoardScreen() : super(OnBoardScreen.name, path: '/on-board-screen');

  static const String name = 'OnBoardScreen';
}

/// generated route for
/// [_i8.SignUpScreen]
class SignUpScreen extends _i13.PageRouteInfo<void> {
  const SignUpScreen() : super(SignUpScreen.name, path: '/sign-up-screen');

  static const String name = 'SignUpScreen';
}

/// generated route for
/// [_i9.VerifyPhoneNumber]
class VerifyPhoneNumber extends _i13.PageRouteInfo<VerifyPhoneNumberArgs> {
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
/// [_i10.UserNameScreen]
class UserNameScreen extends _i13.PageRouteInfo<void> {
  const UserNameScreen()
      : super(UserNameScreen.name, path: '/user-name-screen');

  static const String name = 'UserNameScreen';
}

/// generated route for
/// [_i11.WebViewScreen]
class Webview extends _i13.PageRouteInfo<WebviewArgs> {
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
/// [_i12.MainScreen]
class MainScreen extends _i13.PageRouteInfo<MainScreenArgs> {
  MainScreen({_i35.Key? key, List<_i13.PageRouteInfo>? children})
      : super(MainScreen.name,
            path: '/main-screen',
            args: MainScreenArgs(key: key),
            initialChildren: children);

  static const String name = 'MainScreen';
}

class MainScreenArgs {
  const MainScreenArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'MainScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.EmptyRouterPage]
class GuideHomeTab extends _i13.PageRouteInfo<void> {
  const GuideHomeTab({List<_i13.PageRouteInfo>? children})
      : super(GuideHomeTab.name, path: 'guideHome', initialChildren: children);

  static const String name = 'GuideHomeTab';
}

/// generated route for
/// [_i13.EmptyRouterPage]
class NewsHomeTab extends _i13.PageRouteInfo<void> {
  const NewsHomeTab({List<_i13.PageRouteInfo>? children})
      : super(NewsHomeTab.name, path: 'newsHome', initialChildren: children);

  static const String name = 'NewsHomeTab';
}

/// generated route for
/// [_i13.EmptyRouterPage]
class HomeTab extends _i13.PageRouteInfo<void> {
  const HomeTab({List<_i13.PageRouteInfo>? children})
      : super(HomeTab.name, path: 'home', initialChildren: children);

  static const String name = 'HomeTab';
}

/// generated route for
/// [_i13.EmptyRouterPage]
class TopupTab extends _i13.PageRouteInfo<void> {
  const TopupTab({List<_i13.PageRouteInfo>? children})
      : super(TopupTab.name, path: 'topup', initialChildren: children);

  static const String name = 'TopupTab';
}

/// generated route for
/// [_i13.EmptyRouterPage]
class ContactsTab extends _i13.PageRouteInfo<void> {
  const ContactsTab({List<_i13.PageRouteInfo>? children})
      : super(ContactsTab.name, path: 'contacts', initialChildren: children);

  static const String name = 'ContactsTab';
}

/// generated route for
/// [_i13.EmptyRouterPage]
class BuyTab extends _i13.PageRouteInfo<void> {
  const BuyTab({List<_i13.PageRouteInfo>? children})
      : super(BuyTab.name, path: 'buy', initialChildren: children);

  static const String name = 'BuyTab';
}

/// generated route for
/// [_i13.EmptyRouterPage]
class AccountTab extends _i13.PageRouteInfo<void> {
  const AccountTab({List<_i13.PageRouteInfo>? children})
      : super(AccountTab.name, path: 'account', initialChildren: children);

  static const String name = 'AccountTab';
}

/// generated route for
/// [_i13.EmptyRouterPage]
class WebviewTab extends _i13.PageRouteInfo<void> {
  const WebviewTab({List<_i13.PageRouteInfo>? children})
      : super(WebviewTab.name, path: 'webview', initialChildren: children);

  static const String name = 'WebviewTab';
}

/// generated route for
/// [_i14.GuideHomeScreen]
class GuideHomeScreen extends _i13.PageRouteInfo<void> {
  const GuideHomeScreen() : super(GuideHomeScreen.name, path: '');

  static const String name = 'GuideHomeScreen';
}

/// generated route for
/// [_i15.NewsScreen]
class NewsHomeScreen extends _i13.PageRouteInfo<void> {
  const NewsHomeScreen() : super(NewsHomeScreen.name, path: '');

  static const String name = 'NewsHomeScreen';
}

/// generated route for
/// [_i16.HomeScreen]
class HomeScreen extends _i13.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i17.ActionDetailsScreen]
class ActionDetailsScreen extends _i13.PageRouteInfo<ActionDetailsScreenArgs> {
  ActionDetailsScreen(
      {required _i37.WalletAction action,
      _i35.ImageProvider<Object>? image,
      required String displayName,
      String? accountAddress,
      required String symbol,
      _i38.Contact? contact})
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

  final _i37.WalletAction action;

  final _i35.ImageProvider<Object>? image;

  final String displayName;

  final String? accountAddress;

  final String symbol;

  final _i38.Contact? contact;

  @override
  String toString() {
    return 'ActionDetailsScreenArgs{action: $action, image: $image, displayName: $displayName, accountAddress: $accountAddress, symbol: $symbol, contact: $contact}';
  }
}

/// generated route for
/// [_i18.TopupScreen]
class TopupScreen extends _i13.PageRouteInfo<void> {
  const TopupScreen() : super(TopupScreen.name, path: 'topUp');

  static const String name = 'TopupScreen';
}

/// generated route for
/// [_i19.TopupExplained]
class TopupExplained extends _i13.PageRouteInfo<TopupExplainedArgs> {
  TopupExplained({_i35.Key? key})
      : super(TopupExplained.name,
            path: 'topup-explained', args: TopupExplainedArgs(key: key));

  static const String name = 'TopupExplained';
}

class TopupExplainedArgs {
  const TopupExplainedArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'TopupExplainedArgs{key: $key}';
  }
}

/// generated route for
/// [_i20.ContactsList]
class ContactsList extends _i13.PageRouteInfo<ContactsListArgs> {
  ContactsList({_i39.SendFlowArguments? pageArgs})
      : super(ContactsList.name,
            path: '', args: ContactsListArgs(pageArgs: pageArgs));

  static const String name = 'ContactsList';
}

class ContactsListArgs {
  const ContactsListArgs({this.pageArgs});

  final _i39.SendFlowArguments? pageArgs;

  @override
  String toString() {
    return 'ContactsListArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i21.SendAmountScreen]
class SendAmountScreen extends _i13.PageRouteInfo<SendAmountScreenArgs> {
  SendAmountScreen({required _i39.SendFlowArguments pageArgs})
      : super(SendAmountScreen.name,
            path: 'send-amount',
            args: SendAmountScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendAmountScreen';
}

class SendAmountScreenArgs {
  const SendAmountScreenArgs({required this.pageArgs});

  final _i39.SendFlowArguments pageArgs;

  @override
  String toString() {
    return 'SendAmountScreenArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i22.SendReviewScreen]
class SendReviewScreen extends _i13.PageRouteInfo<SendReviewScreenArgs> {
  SendReviewScreen({required _i39.SendFlowArguments pageArgs})
      : super(SendReviewScreen.name,
            path: 'send-review',
            args: SendReviewScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendReviewScreen';
}

class SendReviewScreenArgs {
  const SendReviewScreenArgs({required this.pageArgs});

  final _i39.SendFlowArguments pageArgs;

  @override
  String toString() {
    return 'SendReviewScreenArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i23.SendSuccessScreen]
class SendSuccessScreen extends _i13.PageRouteInfo<SendSuccessScreenArgs> {
  SendSuccessScreen({required _i39.SendFlowArguments pageArgs})
      : super(SendSuccessScreen.name,
            path: 'send-success',
            args: SendSuccessScreenArgs(pageArgs: pageArgs));

  static const String name = 'SendSuccessScreen';
}

class SendSuccessScreenArgs {
  const SendSuccessScreenArgs({required this.pageArgs});

  final _i39.SendFlowArguments pageArgs;

  @override
  String toString() {
    return 'SendSuccessScreenArgs{pageArgs: $pageArgs}';
  }
}

/// generated route for
/// [_i24.BuyScreen]
class BuyScreen extends _i13.PageRouteInfo<void> {
  const BuyScreen() : super(BuyScreen.name, path: '');

  static const String name = 'BuyScreen';
}

/// generated route for
/// [_i25.BusinessScreen]
class BusinessScreen extends _i13.PageRouteInfo<BusinessScreenArgs> {
  BusinessScreen({required _i40.Business business, required _i41.Token token})
      : super(BusinessScreen.name,
            path: 'business-screen',
            args: BusinessScreenArgs(business: business, token: token));

  static const String name = 'BusinessScreen';
}

class BusinessScreenArgs {
  const BusinessScreenArgs({required this.business, required this.token});

  final _i40.Business business;

  final _i41.Token token;

  @override
  String toString() {
    return 'BusinessScreenArgs{business: $business, token: $token}';
  }
}

/// generated route for
/// [_i26.AccountScreen]
class AccountScreen extends _i13.PageRouteInfo<void> {
  const AccountScreen() : super(AccountScreen.name, path: '');

  static const String name = 'AccountScreen';
}

/// generated route for
/// [_i27.ShowMnemonic]
class ShowMnemonic extends _i13.PageRouteInfo<void> {
  const ShowMnemonic() : super(ShowMnemonic.name, path: 'show-mnemonic');

  static const String name = 'ShowMnemonic';
}

/// generated route for
/// [_i28.VerifyMnemonic]
class VerifyMnemonic extends _i13.PageRouteInfo<void> {
  const VerifyMnemonic() : super(VerifyMnemonic.name, path: 'verify-mnemonic');

  static const String name = 'VerifyMnemonic';
}

/// generated route for
/// [_i29.DoneBackup]
class DoneBackup extends _i13.PageRouteInfo<void> {
  const DoneBackup() : super(DoneBackup.name, path: 'done-backup');

  static const String name = 'DoneBackup';
}

/// generated route for
/// [_i30.SettingsScreen]
class SettingsScreen extends _i13.PageRouteInfo<void> {
  const SettingsScreen() : super(SettingsScreen.name, path: 'settings-screen');

  static const String name = 'SettingsScreen';
}

/// generated route for
/// [_i31.ProtectYourWallet]
class ProtectYourWallet extends _i13.PageRouteInfo<void> {
  const ProtectYourWallet()
      : super(ProtectYourWallet.name, path: 'protect-your-wallet');

  static const String name = 'ProtectYourWallet';
}

/// generated route for
/// [_i32.ProfileScreen]
class ProfileScreen extends _i13.PageRouteInfo<ProfileScreenArgs> {
  ProfileScreen({_i35.Key? key})
      : super(ProfileScreen.name,
            path: 'profile-screen', args: ProfileScreenArgs(key: key));

  static const String name = 'ProfileScreen';
}

class ProfileScreenArgs {
  const ProfileScreenArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'ProfileScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i33.SocialScreen]
class SocialScreen extends _i13.PageRouteInfo<void> {
  const SocialScreen() : super(SocialScreen.name, path: 'social-screen');

  static const String name = 'SocialScreen';
}

/// generated route for
/// [_i34.WebviewScreen]
class WebViewScreen extends _i13.PageRouteInfo<void> {
  const WebViewScreen() : super(WebViewScreen.name, path: '');

  static const String name = 'WebViewScreen';
}
