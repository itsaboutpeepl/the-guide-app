import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class StripePayService {
  final Dio dio;

  StripePayService(this.dio) {
    dio.options.baseUrl = dotenv.env['STRIPE_PAY_URL']!;
    dio.options.headers = Map.from({"Content-Type": 'application/json'});
  }

  Future<Map<dynamic, dynamic>> startPaymentIntentCheck(String paymentIntentID) async {
    Response response = await dio.get("api/v1/payment_intents/$paymentIntentID");

    Map<dynamic, dynamic> result = response.data;

    print("Payment Intent Result $result");

    return result;
  }

  Future<String> createStripePaymentIntent({
    required String amount,
    required String currency,
    required String walletAddress,
  }) async {
    final int amountNew = (double.parse(amount) * 100).toInt(); // Pounds to pence
    try {
      Response response = await dio.post(
        "/stripe/createPaymentIntent",
        data: {
          'amount': amountNew,
          'currency': currency,
          'walletAddress': walletAddress,
        },
      );

      return response.data['data']['paymentIntent']['clientSecret'];
    } catch (e) {
      log.info('Error createStripePaymentIntent ${e.toString()}');
      return e.toString();
    }
  }
}
