import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:guide_liverpool/utils/log/log.dart';

@lazySingleton
class StripePayService {
  StripePayService(this.dio) {
    dio.options.baseUrl = dotenv.env['STRIPE_PAY_URL']!;
    dio.options.headers = Map.from({'Content-Type': 'application/json'});
  }
  final Dio dio;

  Future<Map<dynamic, dynamic>> startPaymentIntentCheck(
    String paymentIntentID,
  ) async {
    try {
      final Response<dynamic> response =
          await dio.get('api/v1/payment_intents/$paymentIntentID');

      final Map<String, dynamic> result = response.data as Map<String, dynamic>;

      log.info('Payment Intent Result $result');

      return result;
    } catch (e, s) {
      log.info('Error: startPaymentIntentCheck ${e.toString()}');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: Hint.withMap(
            {'error': 'Error: startPaymentIntentCheck ${e.toString()}'}),
      );
      return {};
    }
  }

  Future<String> createStripePaymentIntent({
    required int amount,
    required String currency,
    required String walletAddress,
  }) async {
    try {
      final Response<dynamic> response = await dio.post(
        '/stripe/createPaymentIntent',
        data: {
          'amount': amount,
          'currency': currency,
          'walletAddress': walletAddress,
        },
      );

      return response.data['data']['paymentIntent']['clientSecret'] as String;
    } catch (e, s) {
      log.info('Error createStripePaymentIntent ${e.toString()}');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: Hint.withMap(
            {'error': 'Error createStripePaymentIntent ${e.toString()}'}),
      );
      return e.toString();
    }
  }
}
