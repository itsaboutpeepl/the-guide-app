// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserState _$$_UserStateFromJson(Map<String, dynamic> json) => _$_UserState(
      contractVersion: json['contractVersion'] as String?,
      walletModules: json['walletModules'] == null
          ? null
          : WalletModules.fromJson(
              json['walletModules'] as Map<String, dynamic>),
      installedAt: json['installedAt'] == null
          ? null
          : DateTime.parse(json['installedAt'] as String),
      isLoggedOut: json['isLoggedOut'] as bool? ?? false,
      backup: json['backup'] as bool? ?? false,
      walletAddress: json['walletAddress'] as String? ?? '',
      networks: (json['networks'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mnemonic: (json['mnemonic'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      privateKey: json['privateKey'] as String? ?? '',
      pincode: json['pincode'] as String? ?? '',
      accountAddress: json['accountAddress'] as String? ?? '',
      countryCode: json['countryCode'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      isoCode: json['isoCode'] as String? ?? '',
      jwtToken: json['jwtToken'] as String? ?? '',
      displayName: json['displayName'] as String? ?? 'Anom',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      email: json['email'] as String? ?? '',
      verificationId: json['verificationId'] as String?,
      identifier: json['identifier'] as String? ?? '',
      authType: $enumDecodeNullable(_$BiometricAuthEnumMap, json['authType']) ??
          BiometricAuth.none,
      locale: localeFromJson(json['locale'] as Map<String, dynamic>?),
      hasSavedSeedPhrase: json['hasSavedSeedPhrase'] as bool? ?? false,
      initialLoginDateTime: json['initialLoginDateTime'] as String? ?? '',
      showSeedPhraseBanner: json['showSeedPhraseBanner'] as bool? ?? false,
      postCode: json['postCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserStateToJson(_$_UserState instance) =>
    <String, dynamic>{
      'contractVersion': instance.contractVersion,
      'walletModules': instance.walletModules?.toJson(),
      'installedAt': instance.installedAt?.toIso8601String(),
      'isLoggedOut': instance.isLoggedOut,
      'backup': instance.backup,
      'walletAddress': instance.walletAddress,
      'networks': instance.networks,
      'mnemonic': instance.mnemonic,
      'privateKey': instance.privateKey,
      'pincode': instance.pincode,
      'accountAddress': instance.accountAddress,
      'countryCode': instance.countryCode,
      'phoneNumber': instance.phoneNumber,
      'isoCode': instance.isoCode,
      'jwtToken': instance.jwtToken,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'email': instance.email,
      'verificationId': instance.verificationId,
      'identifier': instance.identifier,
      'authType': _$BiometricAuthEnumMap[instance.authType]!,
      'locale': localeToJson(instance.locale),
      'hasSavedSeedPhrase': instance.hasSavedSeedPhrase,
      'initialLoginDateTime': instance.initialLoginDateTime,
      'showSeedPhraseBanner': instance.showSeedPhraseBanner,
      'postCode': instance.postCode,
    };

const _$BiometricAuthEnumMap = {
  BiometricAuth.faceID: 'faceID',
  BiometricAuth.touchID: 'touchID',
  BiometricAuth.pincode: 'pincode',
  BiometricAuth.none: 'none',
};
