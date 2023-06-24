import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:guide_liverpool/constants/analytics_events.dart';
import 'package:guide_liverpool/utils/analytics.dart';
import 'package:guide_liverpool/utils/extensions.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:guide_liverpool/features/topup/dialogs/card_failed.dart';
import 'package:guide_liverpool/features/topup/dialogs/minting_dialog.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';

//TODO: Move class
class StripeCustomResponse {
  StripeCustomResponse({
    required this.ok,
    this.msg = '',
  });
  final bool ok;
  final String? msg;
}

@lazySingleton
class StripeService {
  final Stripe instance = Stripe.instance;

  void init() {
    Stripe.publishableKey =
        dotenv.env['STRIPE_API_KEY']!; //TODO: Add kDebugMode check
    Stripe.merchantIdentifier = "merchant.com.theguideliverpool";
  }

  Future<bool> isPlatformPaySupported() {
    return instance.isPlatformPaySupported();
  }

  Future<bool> handleStripe({
    required String walletAddress,
    required int amount,
    required BuildContext context,
    required bool shouldPushToHome,
  }) async {
    try {
      final paymentIntentClientSecret =
          await stripePayService.createStripePaymentIntent(
        amount: amount,
        currency: 'gbp',
        walletAddress: walletAddress,
      );

      await instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          style: ThemeMode.dark,
          merchantDisplayName: 'vegi',
          paymentIntentClientSecret: paymentIntentClientSecret,
        ),
      );
      await instance.presentPaymentSheet();

      await showDialog<void>(
        context: context,
        builder: (context) {
          return MintingDialog(
            amountText: amount.formattedPrice,
            shouldPushToHome: shouldPushToHome,
          );
        },
        barrierDismissible: false,
      );
      return true;
    } on Exception catch (e, s) {
      if (e is StripeException) {
        if (e.error.code != FailureCode.Canceled) {
          unawaited(
            Analytics.track(
              eventName: AnalyticsEvents.mint,
              properties: {
                'status': 'failure',
              },
            ),
          );
          log.error(e.error.localizedMessage);
          await Sentry.captureException(
            e,
            stackTrace: s,
            hint: Hint.withMap({
              'error': 'ERROR - Stripe Exception: ${e.error.localizedMessage}'
            }),
          );
          await showDialog<void>(
            context: context,
            builder: (context) => const TopUpFailed(
              isFailed: true,
            ),
          );
          return false;
        } else {
          return false;
        }
      } else {
        log.error(e);
        await Sentry.captureException(
          e,
          stackTrace: s,
          hint: Hint.withMap({'error': 'ERROR - Stripe Exception: $e'}),
        );
        await showDialog<void>(
          context: context,
          builder: (context) => const TopUpFailed(
            isFailed: true,
          ),
        );
        return false;
      }
    }
  }

  Future<bool> handleApplePay({
    required String productName,
    required String walletAddress,
    required int amount,
    required BuildContext context,
    required bool shouldPushToHome,
  }) async {
    try {
      // 1. fetch Intent Client Secret from backend
      final paymentIntentClientSecret =
          await stripePayService.createStripePaymentIntent(
        amount: amount,
        currency: 'gbp',
        walletAddress: walletAddress,
      );

      // 2. Confirm apple pay payment
      await Stripe.instance.confirmPlatformPayPaymentIntent(
        clientSecret: paymentIntentClientSecret,
        confirmParams: PlatformPayConfirmParams.applePay(
          applePay: ApplePayParams(
            cartItems: [
              ApplePayCartSummaryItem.immediate(
                label: productName,
                amount: (amount / 100).toString(),
              )
            ],
            merchantCountryCode: 'gb',
            currencyCode: 'gbp',
          ),
        ),
      );
      await showDialog<void>(
        context: context,
        builder: (context) {
          return MintingDialog(
            amountText: amount.formattedPrice,
            shouldPushToHome: shouldPushToHome,
          );
        },
        barrierDismissible: false,
      );
      return true;
    } on Exception catch (e, s) {
      if (e is StripeException) {
        if (e.error.code != FailureCode.Canceled) {
          unawaited(
            Analytics.track(
              eventName: AnalyticsEvents.mint,
              properties: {
                'status': 'failure',
              },
            ),
          );
          log.error(e.error.localizedMessage);
          await Sentry.captureException(
            e,
            stackTrace: s,
            hint: Hint.withMap({
              'error': 'ERROR - Stripe Exception: ${e.error.localizedMessage}'
            }),
          );
          await showDialog<void>(
            context: context,
            builder: (context) => const TopUpFailed(
              isFailed: true,
            ),
          );
          return false;
        } else {
          return false;
        }
      } else {
        log.error(e);
        await Sentry.captureException(
          e,
          stackTrace: s,
          hint: Hint.withMap({'error': 'ERROR - Stripe Exception: $e'}),
        );
        await showDialog<void>(
          context: context,
          builder: (context) => const TopUpFailed(
            isFailed: true,
          ),
        );
        return false;
      }
    }
  }
}
