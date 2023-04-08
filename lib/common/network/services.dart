import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_liverpool/common/router/routes.dart';

@module
abstract class ServicesModule {
  @lazySingleton
  Graph get graph => Graph();

  @lazySingleton
  ChargeApi get chargeApi => ChargeApi(
        dotenv.env['CHARGE_API_KEY']!,
      );

  @lazySingleton
  RootRouter get rootRouter => RootRouter();
}
