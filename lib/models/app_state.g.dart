// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppState _$$_AppStateFromJson(Map<String, dynamic> json) => _$_AppState(
      userState: const UserStateConverter()
          .fromJson(json['userState'] as Map<String, dynamic>?),
      cashWalletState: const CashWalletStateConverter()
          .fromJson(json['cashWalletState'] as Map<String, dynamic>?),
      homePageState: const HomePageStateConverter()
          .fromJson(json['homePageState'] as Map<String, dynamic>?),
      newsState: const NewsStateConverter()
          .fromJson(json['newsState'] as Map<String, dynamic>?),
      networkTabState: const NetworkTabStateConverter()
          .fromJson(json['networkTabState'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$_AppStateToJson(_$_AppState instance) =>
    <String, dynamic>{
      'userState': const UserStateConverter().toJson(instance.userState),
      'cashWalletState':
          const CashWalletStateConverter().toJson(instance.cashWalletState),
      'homePageState':
          const HomePageStateConverter().toJson(instance.homePageState),
      'newsState': const NewsStateConverter().toJson(instance.newsState),
      'networkTabState':
          const NetworkTabStateConverter().toJson(instance.networkTabState),
    };
