import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/features/topup/dialogs/card_failed.dart';
import 'package:guide_liverpool/features/topup/dialogs/minting_dialog.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class StripeCustomResponse {
  final bool ok;
  final String? msg;

  StripeCustomResponse({
    required this.ok,
    this.msg = '',
  });
}

@lazySingleton
class StripeService {
  final Stripe instance = Stripe.instance;

  void init() {
    Stripe.publishableKey = dotenv.env['STRIPE_API_KEY']!;
  }

  Future<void> handleStripe({
    required String walletAddress,
    required String amountText,
    required BuildContext context,
    required bool shouldPushToHome,
  }) async {
    try {
      final paymentIntentClientSecret =
          await stripePayService.createStripePaymentIntent(
              amount: amountText,
              currency: 'gbp',
              walletAddress: walletAddress);

      await instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          style: ThemeMode.dark,
          merchantDisplayName: 'The Guide Liverpool',
          paymentIntentClientSecret: paymentIntentClientSecret,
        ),
      );
      await instance.presentPaymentSheet();

      showDialog(
        context: context,
        builder: (context) {
          return MintingDialog(
            amountText: amountText,
            shouldPushToHome: shouldPushToHome,
          );
        },
        barrierDismissible: false,
      );
    } on Exception catch (e, s) {
      if (e is StripeException) {
        log.error(e.error.localizedMessage);
        Sentry.captureException(
          e,
          stackTrace: s,
          hint: 'ERROR - Stripe Exception: ${e.error.localizedMessage}',
        );
        showDialog(
          context: context,
          builder: (context) => TopUpFailed(
            isFailed: true,
          ),
        );
      } else {
        log.error(e);
        Sentry.captureException(
          e,
          stackTrace: s,
          hint: 'ERROR - Stripe Exception: $e',
        );
        showDialog(
          context: context,
          builder: (context) => TopUpFailed(
            isFailed: true,
          ),
        );
      }
    }
  }
}
