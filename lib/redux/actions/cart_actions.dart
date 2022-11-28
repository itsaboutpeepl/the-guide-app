import 'dart:async';

import 'package:charge_wallet_sdk/charge_wallet_sdk.dart';
import 'package:flutter/material.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/features/shared/widgets/payment/paymentSheet.dart';
import 'package:guide_liverpool/features/topup/dialogs/processing_payment.dart';
import 'package:guide_liverpool/models/app_state.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/constants.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';

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

ThunkAction<AppState> queryOrderDetailsFromPaymentIntentID(
    BuildContext context) {
  return (Store<AppState> store) async {
    try {
      Map<dynamic, dynamic> details = await peeplPaySerivce
          .requestPaymentIntentIdDetails(store.state.cartState.paymentIntentID);

      if (details.containsKey("vendorDisplayName") &&
          details.containsKey("amount") &&
          details.containsKey("recipientWalletAddress")) {
        store.dispatch(UpdateRestaurantName(details["vendorDisplayName"]));
        store.dispatch(UpdateCartTotal(details["amount"]));
        store.dispatch(
            UpdateRestaurantWalletAddress(details["recipientWalletAddress"]));
        showModalBottomSheet(
          useRootNavigator: true,
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          elevation: 5,
          context: context,
          builder: (context) => PaymentSheet(),
        );
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

// ThunkAction sendTokenPayment(
//     VoidCallback successCallback, VoidCallback errorCallback) {
//   return (Store store) async {
//     try {
//       print("PAYMENT INTENT ID" + store.state.cartState.paymentIntentID);
//       //Set loading to true
//       store.dispatch(SetTransferringPayment(true));

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
//           store.state.cartState.selectedGBPxAmount != 0.0
//               ? double.parse(GBPxToken.getBalance().replaceAll(",", "")) >
//                       store.state.cartState.selectedGBPxAmount
//                   ? await chargeApi.tokenTransfer(
//                       getIt<Web3>(instanceName: 'fuseWeb3'),
//                       store.state.userState.walletAddress,
//                       GBPxToken.address,
//                       store.state.cartState
//                           .restaurantWalletAddress, //TODO: change
//                       tokensAmount:
//                           store.state.cartState.selectedGBPxAmount.toString(),
//                       externalId: store.state.cartState.paymentIntentID,
//                     )
//                   : {}
//               : {};

//       print(GBPxResponse);

//       //If Selected PPL Amount is not 0, transfer PPL
//       Map<String, dynamic> PPLResponse =
//           store.state.cartState.selectedPPLAmount != 0.0
//               ? double.parse(PPLToken.getBalance().replaceAll(",", "")) >
//                       store.state.cartState.selectedPPLAmount
//                   ? await chargeApi.tokenTransfer(
//                       getIt<Web3>(instanceName: 'fuseWeb3'),
//                       store.state.userState.walletAddress,
//                       PPLToken.address,
//                       store.state.cartState
//                           .restaurantWalletAddress, //TODO: change
//                       tokensAmount:
//                           store.state.cartState.selectedPPLAmount.toString(),
//                       externalId: store.state.cartState.paymentIntentID,
//                     )
//                   : {}
//               : {};

//       print(PPLResponse);

//       if (GBPxResponse.isNotEmpty || PPLResponse.isNotEmpty) {
//         Future.delayed(Duration(seconds: 2), () {
//           store.dispatch(SetTransferringPayment(false));
//           store.dispatch(SetConfirmed(true));
//           successCallback();
//         });
//       }
//     } catch (e, s) {
//       store.dispatch(SetError(true));
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
          store.state.cartState.selectedGBPxAmount;

      final hasSufficientGbpxBalance =
          selectedGBPXAmount.compareTo(currentGBPXAmount) < 0;

      if (hasSufficientGbpxBalance) {
        store.dispatch(startTokenPaymentToRestaurant(context: context));
      } else {
        await stripeService
            .handleStripe(
          walletAddress: store.state.userState.walletAddress,
          amount: selectedGBPXAmount.toInt(), //TODO: fix
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
      log.error('ERROR - sendOrderObject $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - sendOrderObject $e',
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
          store.state.cashWalletState.tokens[gbpxToken.address]!.amount;

      final BigInt selectedGBPXAmount =
          BigInt.from(store.state.cartState.selectedGBPxAmount);

      final BigInt selectedPPLAmount =
          BigInt.from(store.state.cartState.selectedPPLAmount);

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
            store.state.cartState.restaurantWalletAddress,
            tokensAmount: store.state.cartState.selectedGBPxAmount.toString(),
            externalId: store.state.cartState.paymentIntentID,
          ) as Map<String, dynamic>;
        }
      }

      if (isPPLSelected) {
        if (currentPPLAmount.compareTo(selectedPPLAmount) > 0) {
          pplResponse = await chargeApi.tokenTransfer(
            getIt<Web3>(),
            store.state.userState.walletAddress,
            pplToken.address,
            store.state.cartState.restaurantWalletAddress,
            tokensAmount: store.state.cartState.selectedPPLAmount.toString(),
            externalId: store.state.cartState.paymentIntentID,
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
