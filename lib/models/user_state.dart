import 'package:charge_wallet_sdk/models/wallet_modules/wallet_modules.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:guide_liverpool/constants/enums.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

String currencyJson(String? currency) => currency ?? 'usd';

BiometricAuth? authTypeFromJson(String auth) =>
    EnumToString.fromString(BiometricAuth.values, auth);

Locale localeFromJson(Map<String, dynamic>? map) => map == null
    ? const Locale('en', 'US')
    : Locale(map['languageCode'].toString(), map['countryCode'].toString());

Map<String, dynamic> localeToJson(Locale? locale) => locale == null
    ? {'languageCode': 'en', 'countryCode': 'US'}
    : {'languageCode': locale.languageCode, 'countryCode': locale.countryCode};

@freezed
class UserState with _$UserState {
  @JsonSerializable()
  factory UserState({
    @JsonKey(ignore: true) String? wcURI,
    String? contractVersion,
    WalletModules? walletModules,
    DateTime? installedAt,
    @Default(false) bool isLoggedOut,
    @Default(false) bool backup,
    @Default('') String walletAddress,
    @Default([]) List<String> networks,
    @Default([]) List<String> mnemonic,
    @Default('') String privateKey,
    @Default('') String pincode,
    @Default('') String accountAddress,
    @Default('') String countryCode,
    @Default('') String phoneNumber,
    @Default('') String isoCode,
    @Default('') String jwtToken,
    @Default('Anom') String displayName,
    @Default('') String avatarUrl,
    @Default('') String email,
    String? verificationId,
    @Default('') String identifier,
    @JsonKey(ignore: true) @Default(false) bool hasUpgrade,
    @Default(BiometricAuth.none) BiometricAuth authType,
    @JsonKey(fromJson: localeFromJson, toJson: localeToJson) Locale? locale,
    @JsonKey(ignore: true) PhoneAuthCredential? credentials,
    @Default(false) bool hasSavedSeedPhrase,
    @Default('') String initialLoginDateTime,
    @Default(false) bool showSeedPhraseBanner,
    @Default('') String postCode,
  }) = _UserState;

  const UserState._();

  factory UserState.initial() => UserState(
        networks: [],
        mnemonic: [],
        displayName: 'Anom',
        backup: false,
        authType: BiometricAuth.none,
        postCode: '',
      );

  factory UserState.fromJson(Map<String, dynamic> json) =>
      _$UserStateFromJson(json);
}

class UserStateConverter
    implements JsonConverter<UserState, Map<String, dynamic>?> {
  const UserStateConverter();

  @override
  UserState fromJson(Map<String, dynamic>? json) =>
      json != null ? UserState.fromJson(json) : UserState.initial();

  @override
  Map<String, dynamic> toJson(UserState instance) => instance.toJson();
}
