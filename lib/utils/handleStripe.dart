import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:guide_liverpool/features/topup/dialogs/card_failed.dart';
import 'package:guide_liverpool/features/topup/dialogs/minting_dialog.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';

Future<void> handleStripe({
  required String walletAddress,
  required String amountText,
  required BuildContext context,
  required bool shouldPushToHome,
}) async {
  try {
    final paymentIntentClientSecret = await stripePayService.createStripePaymentIntent(
        amount: amountText, currency: 'gbp', walletAddress: walletAddress);
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        applePay: false,
        googlePay: false,
        style: ThemeMode.dark,
        testEnv: true,
        merchantCountryCode: 'GB',
        merchantDisplayName: 'Peepl',
        paymentIntentClientSecret: paymentIntentClientSecret,
        currencyCode: "gbp",
      ),
    );
    await Stripe.instance.presentPaymentSheet();
    //TODO: add timer for dialog

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
  } on Exception catch (e) {
    if (e is StripeException) {
      log.error(e.error.localizedMessage);
      showDialog(
        context: context,
        builder: (context) => TopUpFailed(),
      );
    }
  }
}
