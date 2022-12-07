import 'dart:async';

import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/constants/analytics_events.dart';
import 'package:guide_liverpool/utils/analytics.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/features/shared/payment/paymentSheet.dart';
import 'package:guide_liverpool/features/topup/dialogs/processing_payment.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:guide_liverpool/utils/log/log.dart';

class ClearCart {
  ClearCart();

  @override
  String toString() => 'ClearCart';
}

class UpdateCartTotal {
  int cartTotal;
  UpdateCartTotal(this.cartTotal);

  @override
  String toString() => 'UpdateCartTotal : cartTotal: $cartTotal';
}

class UpdateRestaurantName {
  String restaurantName;
  UpdateRestaurantName(this.restaurantName);

  @override
  String toString() => 'UpdateRestaurantName : restaurantName: $restaurantName';
}

class UpdateRestaurantWalletAddress {
  String restaurantWalletAddress;
  UpdateRestaurantWalletAddress(this.restaurantWalletAddress);

  @override
  String toString() =>
      'UpdateRestaurantWalletAddress : restaurantWalletAddress: $restaurantWalletAddress';
}

class SetTransferringPayment {
  bool flag;
  SetTransferringPayment({required this.flag});

  @override
  String toString() => 'SetTransferringPayment : flag: $flag';
}

class SetError {
  bool flag;
  SetError({required this.flag});

  @override
  String toString() => 'SetError : flag: $flag';
}

class SetConfirmed {
  bool flag;
  SetConfirmed(this.flag);

  @override
  String toString() => 'SetConfirmed : flag: $flag';
}

class UpdatePaymentIntentID {
  String paymentIntentID;
  UpdatePaymentIntentID(this.paymentIntentID);

  @override
  String toString() =>
      'UpdatePaymentIntentID : paymentIntentID: $paymentIntentID';
}

class UpdateSelectedAmounts {
  final double gbpxAmount;
  final double pplAmount;
  UpdateSelectedAmounts({required this.gbpxAmount, required this.pplAmount});

  @override
  String toString() =>
      'UpdateSelectedAmounts : gbpxAmount: $gbpxAmount, pplAmount: $pplAmount';
}

class UpdateCurrentUrl {
  final String currentUrl;

  UpdateCurrentUrl(this.currentUrl);

  @override
  String toString() => 'UpdateCurrentUrl : currentUrl: $currentUrl';
}

class UpdateUserEmail {
  final String email;

  UpdateUserEmail(this.email);

  @override
  String toString() => 'UpdateUserEmail : email: $email';
}

ThunkAction<AppState> queryOrderDetailsFromPaymentIntentID({
  required BuildContext context,
  required String selectedPaymentMethod,
}) {
  return (Store<AppState> store) async {
    try {
      final Map<dynamic, dynamic> result = await peeplPayService
          .checkOrderValidity(store.state.networkTabState.paymentIntentID);

      final Map<String, dynamic> paymentIntentDetails = result['paymentIntent'];

      if (paymentIntentDetails.containsKey('vendorDisplayName') &&
          paymentIntentDetails.containsKey('amount') &&
          paymentIntentDetails.containsKey('recipientWalletAddress')) {
        store
          ..dispatch(
            UpdateRestaurantName(
                paymentIntentDetails['vendorDisplayName'] as String? ?? ''),
          )
          ..dispatch(
            UpdateCartTotal(
              paymentIntentDetails['amount'] as int? ?? 0,
            ),
          )
          ..dispatch(
            UpdateRestaurantWalletAddress(
              paymentIntentDetails['recipientWalletAddress'] as String? ?? '',
            ),
          );
        store.dispatch(startPaymentProcess(
          context: context,
          selectedPaymentMethod: selectedPaymentMethod,
        ));
      } else {
        throw Exception('Payment Intent failed');
      }
    } catch (e, s) {
      store.dispatch(SetError(flag: true));
      log.error('ERROR - queryOrderDetailsFromPaymentIntentID $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - queryOrderDetailsFromPaymentIntentID $e',
      );
    }
  };
}

ThunkAction<AppState> startPaymentProcess({
  required BuildContext context,
  required String selectedPaymentMethod,
}) {
  return (Store<AppState> store) async {
    try {
      if (selectedPaymentMethod == 'stripe') {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.payStripe,
          ),
        );
        await stripeService
            .handleStripe(
          walletAddress: store.state.userState.walletAddress,
          amount: store.state.networkTabState.cartTotal,
          context: context,
          shouldPushToHome: false,
        )
            .then(
          (value) {
            if (!value) {
              store.dispatch(SetTransferringPayment(flag: value));
              return;
            }
            unawaited(
              Analytics.track(
                eventName: AnalyticsEvents.mint,
                properties: {
                  'status': 'success',
                },
              ),
            );
            store
              ..dispatch(
                UpdateSelectedAmounts(
                  gbpxAmount: (store.state.networkTabState.cartTotal) / 100,
                  pplAmount: 0,
                ),
              )
              ..dispatch(
                startTokenPaymentToRestaurant(
                  context: context,
                ),
              );
          },
        );
      } else if (selectedPaymentMethod == 'peeplPay') {
        unawaited(
          Analytics.track(
            eventName: AnalyticsEvents.payPeepl,
          ),
        );
        await showModalBottomSheet<Widget>(
          isScrollControlled: true,
          backgroundColor: Colors.grey[900],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          elevation: 5,
          context: context,
          builder: (context) => const PaymentSheet(),
        );
      }
    } catch (e, s) {
      log.error('ERROR - sendOrderObject $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - sendOrderObject $e',
      );
    }
  };
}

// ThunkAction<AppState>sendTokenPayment(
//     VoidCallback successCallback, VoidCallback errorCallback) {
//   return (Store store) async {
//     try {
//       print("PAYMENT INTENT ID" + store.state.networkTabState.paymentIntentID);
//       //Set loading to true
//       store.dispatch(SetTransferringPayment(flag: true));

//       //Get tokens for GBPx and PPL
//       Token GBPxToken = store.state.cashWalletState.tokens.values.firstWhere(
//         (token) =>
//             token.symbol.toLowerCase() == "GBPx".toString().toLowerCase(),
//       );

//       Token PPLToken = store.state.cashWalletState.tokens.values.firstWhere(
//         (token) => token.symbol.toLowerCase() == "PPL".toString().toLowerCase(),
//       );

//       //If Selected GBPx amount is not 0, transfer GBPx
//       Map<String, dynamic> GBPxResponse =
//           store.state.networkTabState.selectedGBPxAmount != 0.0
//               ? double.parse(GBPxToken.getBalance().replaceAll(",", "")) >
//                       store.state.networkTabState.selectedGBPxAmount
//                   ? await chargeApi.tokenTransfer(
//                       getIt<Web3>(),
//                       store.state.userState.walletAddress,
//                       GBPxToken.address,
//                       store.state.networkTabState.restaurantWalletAddress,
//                       tokensAmount: store
//                           .state.networkTabState.selectedGBPxAmount
//                           .toString(),
//                       externalId: store.state.networkTabState.paymentIntentID,
//                     )
//                   : {}
//               : {};

//       print(GBPxResponse);

//       //If Selected PPL Amount is not 0, transfer PPL
//       Map<String, dynamic> PPLResponse =
//           store.state.networkTabState.selectedPPLAmount != 0.0
//               ? double.parse(PPLToken.getBalance().replaceAll(",", "")) >
//                       store.state.networkTabState.selectedPPLAmount
//                   ? await chargeApi.tokenTransfer(
//                       getIt<Web3>(),
//                       store.state.userState.walletAddress,
//                       PPLToken.address,
//                       store.state.networkTabState.restaurantWalletAddress,
//                       tokensAmount: store
//                           .state.networkTabState.selectedPPLAmount
//                           .toString(),
//                       externalId: store.state.networkTabState.paymentIntentID,
//                     )
//                   : {}
//               : {};

//       print(PPLResponse);

//       if (GBPxResponse.isNotEmpty || PPLResponse.isNotEmpty) {
//         Future.delayed(Duration(seconds: 2), () {
//           store.dispatch(SetTransferringPayment(flag: false));
//           store.dispatch(SetConfirmed(true));
//           successCallback();
//         });
//       }
//     } catch (e, s) {
//       store.dispatch(SetError(flag: true));
//       log.error('ERROR - sendTokenPayment $e');
//       await Sentry.captureException(
//         e,
//         stackTrace: s,
//         hint: 'ERROR - sendTokenPayment $e',
//       );
//     }
//   };
// }

ThunkAction<AppState> startPeeplPayProcess({
  required BuildContext context,
}) {
  return (Store<AppState> store) async {
    try {
      final double currentGBPXAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.getAmount();

      final double selectedGBPXAmount =
          store.state.networkTabState.selectedGBPxAmount;

      final hasSufficientGbpxBalance =
          selectedGBPXAmount.compareTo(currentGBPXAmount) <= 0;

      if (hasSufficientGbpxBalance) {
        store.dispatch(startTokenPaymentToRestaurant(context: context));
      } else {
        await stripeService
            .handleStripe(
          walletAddress: store.state.userState.walletAddress,
          amount: (selectedGBPXAmount * 100).toInt(),
          context: context,
          shouldPushToHome: false,
        )
            .then(
          (value) {
            if (!value) {
              store.dispatch(SetTransferringPayment(flag: value));
              return;
            }
            store.dispatch(
              startTokenPaymentToRestaurant(
                context: context,
              ),
            );
          },
        );
      }
    } catch (e, s) {
      log.error('ERROR - startPeeplPayProcess $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - startPeeplPayProcess $e',
      );
    }
  };
}

ThunkAction<AppState> startTokenPaymentToRestaurant({
  required BuildContext context,
}) {
  return (Store<AppState> store) async {
    try {
      //Set loading to true
      store.dispatch(SetTransferringPayment(flag: true));
      unawaited(
        showDialog<void>(
          context: context,
          builder: (context) => const ProcessingPayment(),
        ),
      );

      final BigInt currentGBPXAmount =
          store.state.cashWalletState.tokens[gbpxToken.address]!.amount;

      final BigInt currentPPLAmount =
          store.state.cashWalletState.tokens[pplToken.address]!.amount;

      final BigInt selectedGBPXAmount =
          BigInt.from(store.state.networkTabState.selectedGBPxAmount);

      final BigInt selectedPPLAmount =
          BigInt.from(store.state.networkTabState.selectedPPLAmount);

      final bool isGBPXSelected = selectedGBPXAmount.compareTo(BigInt.zero) > 0;
      final bool isPPLSelected = selectedPPLAmount.compareTo(BigInt.zero) > 0;

      Map<String, dynamic> gbpxResponse = {};
      Map<String, dynamic> pplResponse = {};

      if (isGBPXSelected) {
        if (currentGBPXAmount.compareTo(selectedGBPXAmount) > 0) {
          gbpxResponse = await chargeApi.tokenTransfer(
            getIt<Web3>(),
            store.state.userState.walletAddress,
            gbpxToken.address,
            store.state.networkTabState.restaurantWalletAddress,
            tokensAmount:
                store.state.networkTabState.selectedGBPxAmount.toString(),
            externalId: store.state.networkTabState.paymentIntentID,
          ) as Map<String, dynamic>;
        }
      }

      if (isPPLSelected) {
        if (currentPPLAmount.compareTo(selectedPPLAmount) > 0) {
          pplResponse = await chargeApi.tokenTransfer(
            getIt<Web3>(),
            store.state.userState.walletAddress,
            pplToken.address,
            store.state.networkTabState.restaurantWalletAddress,
            tokensAmount:
                store.state.networkTabState.selectedPPLAmount.toString(),
            externalId: store.state.networkTabState.paymentIntentID,
          ) as Map<String, dynamic>;
        }
      }

      if (isGBPXSelected && gbpxResponse.isEmpty) {
        throw Exception('Error transferring GBPX token: $gbpxResponse');
      }
      if (isPPLSelected && pplResponse.isEmpty) {
        throw Exception('Error transferring PPL token: $pplResponse');
      }
      log
        ..info('gbpxResponse: $gbpxResponse')
        ..info('pplResponse: $pplResponse');
      store.dispatch(SetConfirmed(true));
    } catch (e, s) {
      store.dispatch(SetError(flag: true));
      log.error('ERROR - startTokenPaymentToRestaurant $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - startTokenPaymentToRestaurant $e',
      );
    }
  };
}

ThunkAction<AppState> createVideoView(
    String videoID,
    void Function(int rewardAmount) successCallback,
    VoidCallback errorCallback) {
  return (Store<AppState> store) async {
    try {
      final int rewardsIssued = await peeplMediaService.createVideoView(
        videoID,
        store.state.userState.walletAddress,
      );
      if (rewardsIssued > 0) {
        successCallback(rewardsIssued);
      }
    } catch (e, s) {
      errorCallback();
      log.error('ERROR - createVideoView $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - createVideoView $e',
      );
    }
  };
}
