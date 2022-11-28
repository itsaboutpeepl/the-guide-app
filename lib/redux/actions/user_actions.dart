import 'dart:async';
import 'dart:io';
import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/common/router/routes.dart';
import 'package:guide_liverpool/constants/analytics_events.dart';
import 'package:guide_liverpool/constants/analytics_props.dart';
import 'package:guide_liverpool/constants/enums.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/models/user_state.dart';
import 'package:guide_liverpool/redux/actions/cash_wallet_actions.dart';
import 'package:guide_liverpool/utils/analytics.dart';
import 'package:guide_liverpool/utils/json_helpers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_number/phone_number.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:guide_liverpool/services.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:guide_liverpool/utils/log/log.dart';

class SetWalletConnectURI {
  SetWalletConnectURI(this.wcURI);
  final String wcURI;

  @override
  String toString() => 'SetWalletConnectURI : wcURI: $wcURI';
}

class ScrollToTop {
  ScrollToTop({
    required this.value,
  });
  final bool value;

  @override
  String toString() => 'ScrollToTop : value: $value';
}

class ToggleUpgrade {
  ToggleUpgrade({
    required this.value,
  });
  final bool value;

  @override
  String toString() => 'ToggleUpgrade : value: $value';
}

class UpdateCurrency {
  UpdateCurrency({required this.currency});
  final String currency;

  @override
  String toString() => 'UpdateCurrency : currency: $currency';
}

class UpdateLocale {
  UpdateLocale({required this.locale});
  final Locale locale;

  @override
  String toString() => 'UpdateLocale : locale: $locale';
}

class WarnSendDialogShowed {
  WarnSendDialogShowed({
    required this.value,
  });
  final bool value;

  @override
  String toString() => 'WarnSendDialogShowed : value: $value';
}

class SetSecurityType {
  SetSecurityType({required this.biometricAuth});
  BiometricAuth biometricAuth;

  @override
  String toString() => 'SetSecurityType : biometricAuth: $biometricAuth';
}

class CreateLocalAccountSuccess {
  CreateLocalAccountSuccess(
    this.mnemonic,
    this.privateKey,
    this.accountAddress,
  );
  final List<String> mnemonic;
  final String privateKey;
  final String accountAddress;

  @override
  String toString() => 'CreateLocalAccountSuccess : mnemonic: $mnemonic, '
      'privateKey: $privateKey, accountAddress: $accountAddress';
}

class ReLogin {
  ReLogin();

  @override
  String toString() => 'ReLogin';
}

class LoginRequestSuccess {
  LoginRequestSuccess({
    required this.countryCode,
    required this.phoneNumber,
    this.displayName,
    this.email,
  });
  final CountryCode countryCode;
  final String phoneNumber;
  final String? displayName;
  final String? email;

  @override
  String toString() => 'LoginRequestSuccess : countryCode: $countryCode, '
      'phoneNumber: $phoneNumber, displayName: $displayName, email: $email';
}

class LogoutRequestSuccess {
  LogoutRequestSuccess();

  @override
  String toString() => 'LogoutRequestSuccess';
}

class LoginVerifySuccess {
  LoginVerifySuccess(this.jwtToken);
  final String jwtToken;

  @override
  String toString() => 'LoginVerifySuccess : jwtToken: $jwtToken,';
}

class SetPincodeSuccess {
  SetPincodeSuccess(this.pincode);
  String pincode;

  @override
  String toString() => 'SetPincodeSuccess : pincode: $pincode';
}

class SetDisplayName {
  SetDisplayName(this.displayName);
  String displayName;

  @override
  String toString() => 'SetDisplayName : displayName: $displayName';
}

class SetEmail {
  SetEmail(this.email);
  String email;

  @override
  String toString() => 'SetEmail : email: $email';
}

class SetUserAvatar {
  SetUserAvatar(this.avatarUrl);
  String avatarUrl;

  @override
  String toString() => 'SetUserAvatar : avatarUrl: $avatarUrl';
}

class BackupRequest {
  BackupRequest();

  @override
  String toString() => 'BackupRequest';
}

class BackupSuccess {
  BackupSuccess();

  @override
  String toString() => 'BackupSuccess';
}

class SetCredentials {
  SetCredentials(this.credentials);
  PhoneAuthCredential? credentials;

  @override
  String toString() => 'SetCredentials : credentials: $credentials';
}

class SetVerificationId {
  SetVerificationId(this.verificationId);
  String verificationId;

  @override
  String toString() => 'SetVerificationId : verificationId: $verificationId';
}

class JustInstalled {
  JustInstalled(this.installedAt);
  final DateTime installedAt;

  @override
  String toString() => 'JustInstalled : installedAt: $installedAt';
}

class DeviceIdSuccess {
  DeviceIdSuccess(this.identifier);
  final String identifier;

  @override
  String toString() => 'DeviceIdSuccess : identifier: $identifier';
}

class SetShowSeedPhraseBanner {
  SetShowSeedPhraseBanner({required this.showSeedPhraseBanner});
  final bool showSeedPhraseBanner;

  @override
  String toString() =>
      'SetShowSeedPhraseBanner : showSeedPhraseBanner: $showSeedPhraseBanner,';
}

class SetHasSavedSeedPhrase {
  SetHasSavedSeedPhrase({required this.hasSavedSeedPhrase});
  final bool hasSavedSeedPhrase;

  @override
  String toString() =>
      'SetHasSavedSeedPhrase : hasSavedSeedPhrase: $hasSavedSeedPhrase';
}

class UpdateUserPostcode {
  UpdateUserPostcode({required this.postCode});
  final String postCode;

  @override
  String toString() => 'UpdateUserPostcode : postCode: $postCode';
}

ThunkAction<AppState> loginHandler(
  CountryCode countryCode,
  PhoneNumber phoneNumber,
  Function onSuccess,
  void Function(String error) onError,
) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(setDeviceId(phoneNumber.e164));
      await Analytics.setUserId(phoneNumber.e164);
      await onBoardStrategy.login(
        store,
        phoneNumber.e164,
        () {
          Analytics.track(
            eventName: AnalyticsEvents.loginWithPhone,
            properties: {
              AnalyticsProps.status: AnalyticsProps.success,
            },
          );
          store.dispatch(
            LoginRequestSuccess(
              countryCode: countryCode,
              phoneNumber: phoneNumber.e164,
            ),
          );
          onSuccess();
        },
        (e) {
          Analytics.track(
            eventName: AnalyticsEvents.loginWithPhone,
            properties: {
              AnalyticsProps.status: AnalyticsProps.failed,
              'error': e.toString(),
            },
          );
          onError(e.toString());
        },
      );
    } catch (e, s) {
      log.error(
        'ERROR - Login Request',
        error: e,
        stackTrace: s,
      );
      onError(e.toString());
      await Analytics.track(
        eventName: AnalyticsEvents.loginWithPhone,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': e.toString(),
        },
      );
      await Sentry.captureException(
        Exception('Error in login with phone number: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR in Login Request',
      );
    }
  };
}

ThunkAction<AppState> verifyHandler(
  String verificationCode,
  Function onSuccess,
  void Function(String error) onError,
) {
  return (Store<AppState> store) async {
    try {
      await onBoardStrategy.verify(
        store,
        verificationCode,
        (String jwtToken) {
          Analytics.track(
            eventName: AnalyticsEvents.verify,
            properties: {
              AnalyticsProps.status: AnalyticsProps.success,
            },
          );
          store.dispatch(LoginVerifySuccess(jwtToken));
          chargeApi.setJwtToken(jwtToken);
          onSuccess();
          rootRouter.push(UserNameScreen());
        },
      );
    } catch (error, s) {
      onError(error.toString());
      await Analytics.track(
        eventName: AnalyticsEvents.verify,
        properties: {
          AnalyticsProps.status: AnalyticsProps.failed,
          'error': error.toString(),
        },
      );
      await Sentry.captureException(
        Exception('Error in verify phone number: ${error.toString()}'),
        stackTrace: s,
        hint: 'Error while phone number verification',
      );
    }
  };
}

ThunkAction<AppState> restoreWalletCall(
  List<String> mnemonic,
  VoidCallback successCallback,
  VoidCallback failureCallback,
) {
  return (Store<AppState> store) async {
    try {
      await Analytics.track(
        eventName: AnalyticsEvents.restoreWallet,
      );
      log
        ..info('restore wallet')
        ..info('mnemonic: $mnemonic')
        ..info('compute pk');
      final String privateKey = await compute(
        Web3.privateKeyFromMnemonic,
        mnemonic.join(' '),
      );
      final Credentials credentials = EthPrivateKey.fromHex(privateKey);
      final EthereumAddress accountAddress = await credentials.extractAddress();
      log
        ..info('privateKey: $privateKey')
        ..info('accountAddress: ${accountAddress.toString()}');
      store.dispatch(
        CreateLocalAccountSuccess(
          mnemonic,
          privateKey,
          accountAddress.toString(),
        ),
      );
      successCallback();
    } catch (e, s) {
      log.error(
        'ERROR - restoreWalletCall',
        error: e,
        stackTrace: s,
      );
      failureCallback();
      await Sentry.captureException(
        Exception('Error in restore mnemonic: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR in restore wallet',
      );
    }
  };
}

ThunkAction<AppState> setDeviceId(String phoneNumber) {
  return (Store<AppState> store) async {
    final String identifier = await FlutterUdid.udid;
    // mixpanel.alias(identifier, phoneNumber);
    log.info('device identifier: $identifier');
    store.dispatch(DeviceIdSuccess(identifier));
  };
}

ThunkAction<AppState> createLocalAccountCall(
  VoidCallback successCallback,
) {
  return (Store<AppState> store) async {
    try {
      log.info('create wallet');
      final String mnemonic = Web3.generateMnemonic();
      log
        ..info('mnemonic: $mnemonic')
        ..info('compute pk');
      final String privateKey = await compute(
        Web3.privateKeyFromMnemonic,
        mnemonic,
      );
      final Credentials credentials = EthPrivateKey.fromHex(privateKey);
      final EthereumAddress accountAddress = await credentials.extractAddress();
      log
        ..info('privateKey: $privateKey')
        ..info('accountAddress: ${accountAddress.toString()}');
      store.dispatch(
        CreateLocalAccountSuccess(
          mnemonic.split(' '),
          privateKey,
          accountAddress.toString(),
        ),
      );
      await Analytics.track(
        eventName: AnalyticsEvents.createWallet,
      );
      successCallback();
    } catch (e, s) {
      log.error(
        'ERROR - createLocalAccountCall',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in generate mnemonic: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR while generate mnemonic',
      );
    }
  };
}

ThunkAction<AppState> reLoginCall() {
  return (Store<AppState> store) async {
    store
      ..dispatch(ReLogin())
      ..dispatch(getWalletAddressesCall());
  };
}

ThunkAction<AppState> identifyCall({String? wallet}) {
  return (Store<AppState> store) async {
    final UserState userState = store.state.userState;
    final String displayName = userState.displayName;

    final String phoneNumber = userState.phoneNumber;
    final String walletAddress = wallet ?? userState.walletAddress;
    final String accountAddress = userState.accountAddress;
    final String identifier = userState.identifier;

    final Map<String, dynamic> properties = {
      'identifier': identifier,
      'phoneNumber': phoneNumber,
      'walletAddress': walletAddress,
      'accountAddress': accountAddress,
      'language': userState.locale.toString(),
      'displayName': displayName,
    };
    await Analytics.identify(properties);
    await Analytics.setUserId(phoneNumber);
    DateTime? installedAt = userState.installedAt;
    if (installedAt == null) {
      log.info('Identify - $phoneNumber');
      installedAt = DateTime.now().toUtc();
      store.dispatch(JustInstalled(installedAt));
    }
  };
}

ThunkAction<AppState> saveUserProfile(String walletAddress) {
  return (Store<AppState> store) async {
    final String displayName = store.state.userState.displayName;
    store.dispatch(storeUserContext());
    try {
      final Map<String, dynamic> userProfile =
          await chargeApi.getUserProfile(walletAddress);
      if (userProfile.isNotEmpty) {
        if (userProfile.containsKey('avatarHash')) {
          store.dispatch(SetUserAvatar(userProfile['imageUri'] as String));
        }
      }
    } catch (e) {
      final Map<String, dynamic> user = {
        'accountAddress': walletAddress,
        'email': 'wallet-user@fuse.io',
        'provider': 'HDWallet',
        'subscribe': false,
        'source': 'wallet-v2',
        'displayName': displayName
      };
      await chargeApi.saveUserProfile(user);
    }
  };
}

ThunkAction<AppState> storeUserContext() {
  return (Store<AppState> store) async {
    try {
      await chargeApi.addUserContext({
        'os': Platform.isAndroid
            ? 'android'
            : Platform.isIOS
                ? 'ios'
                : 'other',
      });
    } catch (e, s) {
      log.error(
        'Error in api.addUserContext',
        error: e,
        stackTrace: s,
      );
    }
  };
}

ThunkAction<AppState> web3Init({
  WalletModules? modules,
}) {
  return (Store<AppState> store) async {
    try {
      final UserState userState = store.state.userState;
      final String privateKey = userState.privateKey;
      final WalletModules? walletModules = modules ?? userState.walletModules;
      if (walletModules != null) {
        if (getIt.isRegistered<Web3>()) {
          await getIt.unregister(instance: getIt<Web3>());
        }
        getIt.registerSingleton<Web3>(Web3());
        await getIt<Web3>().setCredentials(privateKey);
        getIt<Web3>().setModules(walletModules);
      }
    } catch (e, s) {
      log.error(
        'ERROR - web3Init',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in initiate Web3: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR - web3Init',
      );
    }
  };
}

ThunkAction<AppState> setupWalletCall(Map<String, dynamic> walletData) {
  return (Store<AppState> store) async {
    try {
      final List<String> networks =
          List<String>.from(walletData['networks'] as Iterable);
      final String? contractVersion = walletData['version'] as String?;
      final String walletAddress = walletData['walletAddress'] as String;
      final bool backup = walletData['backup'] as bool? ?? false;
      final WalletModules walletModules = WalletModules.fromJson(
        walletData['walletModules'] as Map<String, dynamic>,
      );
      store
        ..dispatch(
          GetWalletDataSuccess(
            backup: backup,
            walletAddress: walletAddress,
            networks: networks,
            contractVersion: contractVersion,
            walletModules: walletModules,
          ),
        )
        ..dispatch(web3Init(modules: walletModules));
    } catch (e, s) {
      log.error(
        'ERROR - setupWalletCall',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in setup wallet call: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR - setupWalletCall',
      );
    }
  };
}

ThunkAction<AppState> getWalletAddressesCall() {
  return (Store<AppState> store) async {
    try {
      final Map<String, dynamic> walletData =
          await chargeApi.getWallet() as Map<String, dynamic>;
      final Map<String, dynamic> data = Map<String, dynamic>.from({
        ...walletData,
      });
      store.dispatch(setupWalletCall(data));
    } catch (e, s) {
      log.error(
        'ERROR - getWalletAddressCall',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in get wallet info: ${e.toString()}'),
        stackTrace: s,
        hint: 'ERROR - getWalletAddressCall',
      );
    }
  };
}

ThunkAction<AppState> updateDisplayNameCall(String displayName) {
  return (Store<AppState> store) async {
    try {
      final String walletAddress = store.state.userState.walletAddress;
      if (walletAddress.isNotEmpty) {
        await chargeApi.updateDisplayName(walletAddress, displayName);
        store.dispatch(SetDisplayName(displayName));
      }
    } catch (e, s) {
      log.error(
        'ERROR - updateDisplayNameCall',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in update user profile name: ${e.toString()}'),
        stackTrace: s,
        hint: 'Error in update user profile name',
      );
    }
  };
}

ThunkAction<AppState> updateUserAvatarCall(ImageSource source) {
  return (Store<AppState> store) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file != null) {
      try {
        final Map<String, dynamic> uploadResponse = await chargeApi
            .uploadImage(File(file.path)) as Map<String, dynamic>;
        final String walletAddress = store.state.userState.walletAddress;
        if (walletAddress.isNotEmpty) {
          await chargeApi.updateAvatar(
            walletAddress,
            uploadResponse['hash'] as String,
          );
          store.dispatch(SetUserAvatar(uploadResponse['uri'] as String));
        }
      } catch (e, s) {
        log.error(
          'ERROR - updateUserAvatarCall',
          error: e,
          stackTrace: s,
        );
        await Sentry.captureException(
          Exception('Error in update user profile image: ${e.toString()}'),
          stackTrace: s,
          hint: 'Error in update user profile image',
        );
      }
    }
  };
}

ThunkAction<AppState> checkWalletUpgrades() {
  return (Store<AppState> store) async {
    try {
      final String walletAddress = store.state.userState.walletAddress;
      if (walletAddress.isNotEmpty) {
        final List<dynamic> response = await chargeApi.getAvailableUpgrades(
          walletAddress,
        );
        final List<WalletUpgrade> walletUpgrades =
            WalletUpgrade.walletUpgradesFromJson(
          response,
        );
        if (walletUpgrades.isNotEmpty) {
          store.dispatch(ToggleUpgrade(value: true));
        }
      }
    } catch (e, s) {
      log.error(
        'ERROR - checkWalletUpgrades',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in check for new wallet upgrades: ${e.toString()}'),
        stackTrace: s,
        hint: 'Error in check for new wallet upgrades',
      );
    }
  };
}

ThunkAction<AppState> installWalletUpgrades(
  VoidCallback onSuccess,
  VoidCallback onError,
) {
  return (Store<AppState> store) async {
    try {
      final String walletAddress = store.state.userState.walletAddress;
      final List<WalletUpgrade> walletUpgrades =
          await chargeApi.getAvailableUpgrades(walletAddress);

      if (walletUpgrades.isNotEmpty) {
        final WalletUpgrade walletUpgrade = walletUpgrades.first;
        if (store.state.userState.walletModules != null) {
          final Map<String, dynamic> installUpgradeJob =
              await chargeApi.installUpgrades(
            getIt<Web3>(),
            walletAddress,
            store.state.userState.walletModules!.transferManager,
            walletUpgrade.contractAddress,
            walletUpgrade.id,
          ) as Map<String, dynamic>;
          store.dispatch(
            fetchJobCall(
              installUpgradeJob['_id'] as String,
              (Map<String, dynamic> jobData) {
                log.info('txHash ${jobData['data']['txHash']}');
                store.dispatch(getWalletAddressesCall());
                onSuccess();
                store
                  ..dispatch(ToggleUpgrade(value: false))
                  ..dispatch(checkWalletUpgrades());
              },
              (dynamic error) {
                store.dispatch(ToggleUpgrade(value: false));
                onError();
              },
            ),
          );
        }
      }
    } catch (e, s) {
      store.dispatch(ToggleUpgrade(value: false));
      onError();
      log.error(
        'ERROR - installWalletUpgrades',
        error: e,
        stackTrace: s,
      );
      await Sentry.captureException(
        Exception('Error in install wallet upgrades: ${e.toString()}'),
        stackTrace: s,
        hint: 'Error in install wallet upgrades',
      );
    }
  };
}

ThunkAction<AppState> fetchJobCall(
  String jobId,
  void Function(Map<String, dynamic> jobData) successCallback,
  void Function(dynamic jobData) failureCallback, {
  bool untilDone = true,
  int seconds = 5,
  void Function(String txHash)? onTxCallback,
}) {
  //TODO: clean this shit up idk wtf is this
  return (Store<AppState> store) {
    Timer.periodic(Duration(seconds: seconds), (Timer timer) async {
      try {
        log.info('jobId $jobId');
        final Map<String, dynamic> response =
            await chargeApi.getJob(jobId) as Map<String, dynamic>;
        if (untilDone) {
          if (isJsonValEmpty(response, 'lastFinishedAt')) {
            log.info('job not done');
            return;
          }
        }
        final Map<String, dynamic> jobData =
            response['data'] as Map<String, dynamic>;
        if (jobData.containsKey('transactionBody')) {
          if ((jobData['transactionBody']['status'] != null &&
                  jobData['transactionBody']['status'] == 'failed') ||
              response['failReason'] != null) {
            final String failReason = response['failReason'] as String? ??
                jobData['transactionBody']['status'] as String;

            log.info('JobId  $jobId failed, failReason: $failReason');
            if (jobData['txHash'] == null) {
              log.info('fetched job with txHash null');
              return;
            } else {
              if (onTxCallback != null) {
                onTxCallback(jobData['txHash'] as String);
              }
            }
            failureCallback(failReason);
            timer.cancel();
          } else {
            if (jobData['txHash'] == null) {
              log.info('fetched job with txHash null');
              return;
            } else {
              if (onTxCallback != null) {
                onTxCallback(jobData['txHash'] as String);
              }
            }
            successCallback(response);
            timer.cancel();
          }
        } else {
          if (jobData['txHash'] == null) {
            log.info('fetched job with txHash null');
            return;
          } else {
            if (onTxCallback != null) {
              onTxCallback(jobData['txHash'] as String);
            }
          }
          successCallback(response);
          timer.cancel();
        }
      } catch (e) {
        log.error('ERROR - fetchJobCall $e');
        failureCallback(e.toString());
        timer.cancel();
      }
    });
  };
}

ThunkAction<AppState> checkForSavedSeedPhrase() {
  return (Store<AppState> store) async {
    if (store.state.userState.hasSavedSeedPhrase) return;
    if (store.state.userState.initialLoginDateTime.isEmpty) return;
    if (DateTime.now()
            .difference(
              DateTime.fromMillisecondsSinceEpoch(
                int.parse(
                  store.state.userState.initialLoginDateTime,
                ),
              ),
            )
            .inDays <
        7) {
      //show the banner
      store.dispatch(SetShowSeedPhraseBanner(showSeedPhraseBanner: true));
    }
  };
}
