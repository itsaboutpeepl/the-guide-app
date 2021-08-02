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
  Map<String, dynamic>? _paymentSheetData;

  StripeService._privateConstructor();

  static final StripeService _instance = StripeService._privateConstructor();

  factory StripeService() => _instance;

  String _paymentApiUrl = '$topUpService/stripe/createPaymentIntent';
  String _apiKey = dotenv.env['STRIPE_API_KEY']!;

  void init() {
    Stripe.publishableKey = _apiKey;
  }

  // Main function to initiate a payment.
  Future<StripeCustomResponse> payWithNewCard({
    required String amount,
    required String currency,
    required String walletAddress,
  }) async {
    try {
      // Step 1: Create payment intent
      _paymentSheetData = await this._createPaymentIntent(
        amount: amount,
        currency: currency,
        walletAddress: walletAddress,
      );

      // 2. initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          applePay: true,
          googlePay: true,
          // style: ThemeMode.dark,
          testEnv: true,
          merchantCountryCode: 'GB',
          merchantDisplayName: 'Peepl',
          paymentIntentClientSecret: _paymentSheetData!['clientSecret'],
        ),
      );

      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet(
          parameters: PresentPaymentSheetParameters(
        clientSecret: _paymentSheetData!['clientSecret'],
        confirmPayment: true,
      ));

      return StripeCustomResponse(ok: true);
    } catch (e) {
      return StripeCustomResponse(
        ok: false,
        msg: e.toString(),
      );
    }
  }

  Future<Map<String, dynamic>> _createPaymentIntent({
    required String amount,
    required String currency,
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
          'walletAddress': walletAddress
        },
        options: Options(
          headers: {"Content-Type": 'application/json'},
        ),
      );
      return response.data['data']['paymentIntent'];
    } catch (e) {
      print('Error _createPaymentIntent ${e.toString()}');
      return {'error': e.toString()};
    }
  }

  // Future<Map> _createPaymentIntent({
  //   required String amount,
  //   required String currency,
  //   required String paymentMethodId,
  //   required String walletAddress,
  // }) async {
  //   try {
  //     final int amountNew =
  //         (double.parse(amount) * 100).toInt(); // Pounds to pence
  //     final Response response = await getIt<Dio>().post(
  //       _paymentApiUrl,
  //       data: {
  //         'amount': amountNew,
  //         'currency': currency,
  //         'paymentMethodId': paymentMethodId,
  //         'walletAddress': walletAddress
  //       },
  //       options: Options(
  //         headers: {"Content-Type": 'application/json'},
  //       ),
  //     );
  //     return response.data['data'];
  //   } catch (e) {
  //     print('Error _crearPaymentIntent ${e.toString()}');
  //     return {'error': e.toString()};
  //   }
  // }

  // Future<StripeCustomResponse> _makePayment({
  //   required String amount,
  //   required String currency,
  //   required PaymentMethod paymentMethod,
  //   required String walletAddress,
  // }) async {
  //   try {
  //     final response = await this._createPaymentIntent(
  //       amount: amount,
  //       currency: currency,
  //       paymentMethodId: paymentMethod.id,
  //       walletAddress: walletAddress,
  //     );
  //     final bool requiresAction =
  //         response['paymentIntent']['requiresAction'] ?? false;
  //     if (requiresAction) {
  //       final params = PaymentMethodParams.cardFromMethodId(
  //         paymentMethodId: paymentMethod.id,
  //       );
  //       final String clientSecret = response['paymentIntent']['clientSecret'];
  //       await Stripe.instance.confirmPaymentMethod(
  //         clientSecret,
  //         params,
  //       );
  //       return StripeCustomResponse(ok: true);
  //     } else {
  //       return StripeCustomResponse(ok: true);
  //     }
  //   } catch (e) {
  //     print('Error _makePayment: ${e.toString()}');
  //     return StripeCustomResponse(
  //       ok: false,
  //       msg: e.toString(),
  //     );
  //   }
  // }
}
