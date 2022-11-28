// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:charge_wallet_sdk/charge_wallet_sdk.dart' as _i3;
import 'package:dio/dio.dart' as _i4;
import 'package:firebase_analytics/firebase_analytics.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i7;
import 'package:firebase_core/firebase_core.dart' as _i6;
import 'package:firebase_messaging/firebase_messaging.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i10;
import 'package:logger/logger.dart' as _i11;
import 'package:package_info/package_info.dart' as _i14;
import 'package:phone_number/phone_number.dart' as _i17;

import '../../services/apis/news.dart' as _i13;
import '../../services/apis/peeplMedia.dart' as _i15;
import '../../services/apis/peeplPay.dart' as _i16;
import '../../services/apis/stripePay.dart' as _i19;
import '../../services/apis/vesting.dart' as _i21;
import '../../utils/connectionChecker.dart' as _i12;
import '../../utils/log/log_it.dart' as _i22;
import '../../utils/onboard/Istrategy.dart' as _i9;
import '../../utils/stripe.dart' as _i20;
import '../network/services.dart' as _i23;
import '../router/routes.dart' as _i18;
import 'dio.dart' as _i24;
import 'firebase.dart' as _i25;
import 'logger_di.dart' as _i28;
import 'network_info_di.dart' as _i27;
import 'onboard.dart' as _i26;
import 'package_info.dart' as _i29;
import 'phone.dart' as _i30; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final servicesModule = _$ServicesModule();
  final dioDi = _$DioDi();
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final onBoardStrategy = _$OnBoardStrategy();
  final networkInfoDi = _$NetworkInfoDi();
  final loggerDi = _$LoggerDi();
  final packageInfoDi = _$PackageInfoDi();
  final phone = _$Phone();
  gh.lazySingleton<_i3.ChargeApi>(() => servicesModule.chargeApi);
  gh.factory<_i4.Dio>(() => dioDi.dio);
  gh.lazySingleton<_i5.FirebaseAnalytics>(
      () => firebaseInjectableModule.firebaseAnalytics);
  await gh.factoryAsync<_i6.FirebaseApp>(
      () => firebaseInjectableModule.firebaseApp,
      preResolve: true);
  gh.lazySingleton<_i7.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i8.FirebaseMessaging>(
      () => firebaseInjectableModule.firebaseMessaging);
  gh.lazySingleton<_i3.FuseExplorer>(() => servicesModule.fuseExplorerAPI);
  gh.lazySingleton<_i3.Graph>(() => servicesModule.graph);
  gh.lazySingleton<_i9.IOnBoardStrategy>(() => onBoardStrategy.onBoardStrategy);
  gh.lazySingleton<_i10.InternetConnectionChecker>(
      () => networkInfoDi.dataConnectionChecker);
  gh.lazySingleton<_i11.Logger>(() => loggerDi.logger);
  gh.lazySingleton<_i12.NetworkInfo>(
      () => _i12.NetworkInfo(get<_i10.InternetConnectionChecker>()));
  gh.lazySingleton<_i13.NewsService>(() => _i13.NewsService(get<_i4.Dio>()));
  await gh.factoryAsync<_i14.PackageInfo>(() => packageInfoDi.packageInfo,
      preResolve: true);
  gh.lazySingleton<_i15.PeeplMediaService>(
      () => _i15.PeeplMediaService(get<_i4.Dio>()));
  gh.lazySingleton<_i16.PeeplPayService>(
      () => _i16.PeeplPayService(get<_i4.Dio>()));
  gh.lazySingleton<_i17.PhoneNumberUtil>(() => phone.phoneNumberUtil);
  gh.lazySingleton<_i18.RootRouter>(() => servicesModule.rootRouter);
  gh.lazySingleton<_i19.StripePayService>(
      () => _i19.StripePayService(get<_i4.Dio>()));
  gh.lazySingleton<_i20.StripeService>(() => _i20.StripeService());
  gh.lazySingleton<_i21.VestingService>(
      () => _i21.VestingService(get<_i4.Dio>()));
  gh.lazySingleton<_i22.LogIt>(() => _i22.LogIt(get<_i11.Logger>()));
  return get;
}

class _$ServicesModule extends _i23.ServicesModule {}

class _$DioDi extends _i24.DioDi {}

class _$FirebaseInjectableModule extends _i25.FirebaseInjectableModule {}

class _$OnBoardStrategy extends _i26.OnBoardStrategy {}

class _$NetworkInfoDi extends _i27.NetworkInfoDi {}

class _$LoggerDi extends _i28.LoggerDi {}

class _$PackageInfoDi extends _i29.PackageInfoDi {}

class _$Phone extends _i30.Phone {}
