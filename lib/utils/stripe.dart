import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:peepl/common/di/di.dart';
import 'package:peepl/utils/constants.dart';

class StripeCustomResponse {
  final bool ok;
  final String? msg;

  StripeCustomResponse({
    required this.ok,
    this.msg = '',
  });
}

class StripeService {
  StripeService._privateConstructor();

  static final StripeService _instance = StripeService._privateConstructor();

  factory StripeService() => _instance;

  String _paymentApiUrl = '$topUpService/stripe/pay';
  String _apiKey = dotenv.env['STRIPE_API_KEY']!;

  void init() {
    Stripe.publishableKey = _apiKey;
  }

  Future<StripeCustomResponse> payWithNewCard({
    required String amount,
    required String currency,
    required String walletAddress,
  }) async {
    try {
      final PaymentMethod paymentMethod =
          await Stripe.instance.createPaymentMethod(
        PaymentMethodParams.card(),
      );
      final StripeCustomResponse resp = await this._makePayment(
        amount: amount,
        currency: currency,
        paymentMethod: paymentMethod,
        walletAddress: walletAddress,
      );

      return resp;
    } catch (e) {
      return StripeCustomResponse(
        ok: false,
        msg: e.toString(),
      );
    }
  }

  Future<Map> _crearPaymentIntent({
    required String amount,
    required String currency,
    required String paymentMethodId,
    required String walletAddress,
  }) async {
    try {
      final int amountNew =
          (double.parse(amount) * 100).toInt(); // Pounds to pence
      final Response response = await getIt<Dio>().post(
        _paymentApiUrl,
        data: {
          'amount': amountNew,
          'currency': currency,
          'paymentMethodId': paymentMethodId,
          'walletAddress': walletAddress
        },
        options: Options(
          headers: {"Content-Type": 'application/json'},
        ),
      );
      return response.data['data'];
    } catch (e) {
      print('Error _crearPaymentIntent ${e.toString()}');
      return {'error': e.toString()};
    }
  }

  Future<StripeCustomResponse> _makePayment({
    required String amount,
    required String currency,
    required PaymentMethod paymentMethod,
    required String walletAddress,
  }) async {
    try {
      final response = await this._crearPaymentIntent(
        amount: amount,
        currency: currency,
        paymentMethodId: paymentMethod.id,
        walletAddress: walletAddress,
      );
      final bool requiresAction =
          response['paymentIntent']['requiresAction'] ?? false;
      if (requiresAction) {
        final params = PaymentMethodParams.cardFromMethodId(
          paymentMethodId: paymentMethod.id,
        );
        final String clientSecret = response['paymentIntent']['clientSecret'];
        await Stripe.instance.confirmPaymentMethod(
          clientSecret,
          params,
        );
        return StripeCustomResponse(ok: true);
      } else {
        return StripeCustomResponse(ok: true);
      }
    } catch (e) {
      print('Error _makePayment: ${e.toString()}');
      return StripeCustomResponse(
        ok: false,
        msg: e.toString(),
      );
    }
  }
}
