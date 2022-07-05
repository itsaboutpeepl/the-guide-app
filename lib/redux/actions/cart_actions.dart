import 'package:flutter/foundation.dart';
import 'package:guide_liverpool/common/di/di.dart';
import 'package:guide_liverpool/models/tokens/token.dart';
import 'package:guide_liverpool/services.dart';
import 'package:guide_liverpool/utils/log/log.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:redux/redux.dart';
import 'package:wallet_core/wallet_core.dart';

class ClearCart {
  ClearCart();
}

class UpdateCartTotal {
  int cartTotal;
  UpdateCartTotal(this.cartTotal);
}

class UpdateRestaurantName {
  String restaurantName;
  UpdateRestaurantName(this.restaurantName);
}

class UpdateRestaurantWalletAddress {
  String restaurantWalletAddress;
  UpdateRestaurantWalletAddress(this.restaurantWalletAddress);
}

class SetTransferringPayment {
  bool flag;
  SetTransferringPayment(this.flag);
}

class SetError {
  bool flag;
  SetError(this.flag);
}

class SetConfirmed {
  bool flag;
  SetConfirmed(this.flag);
}

class UpdatePaymentIntentID {
  String paymentIntentID;
  UpdatePaymentIntentID(this.paymentIntentID);
}

class UpdateSelectedAmounts {
  final double GBPxAmount;
  final double PPLAmount;
  UpdateSelectedAmounts(this.GBPxAmount, this.PPLAmount);
}

ThunkAction queryOrderDetailsFromPaymentIntentID(
    String paymentIntentID, VoidCallback successCallback, VoidCallback errorCallback) {
  return (Store store) async {
    try {
      Map<dynamic, dynamic> details = await peeplPaySerivce.requestPaymentIntentIdDetails(paymentIntentID);

      details.containsKey("vendorDisplayName")
          ? store.dispatch(UpdateRestaurantName(details["vendorDisplayName"]))
          : errorCallback();

      details.containsKey("amount") ? store.dispatch(UpdateCartTotal(details["amount"])) : errorCallback();

      details.containsKey("recipientWalletAddress")
          ? store.dispatch(UpdateRestaurantWalletAddress(details["recipientWalletAddress"]))
          : errorCallback();

      successCallback();
    } catch (e, s) {
      errorCallback();
      store.dispatch(SetError(true));
      log.error('ERROR - queryOrderDetailsFromPaymentIntentID $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - queryOrderDetailsFromPaymentIntentID $e',
      );
    }
  };
}

ThunkAction sendTokenPayment(VoidCallback successCallback, VoidCallback errorCallback) {
  return (Store store) async {
    try {
      print("PAYMENT INTENT ID" + store.state.cartState.paymentIntentID);
      //Set loading to true
      store.dispatch(SetTransferringPayment(true));

      //Get tokens for GBPx and PPL
      Token GBPxToken = store.state.cashWalletState.tokens.values.firstWhere(
        (token) => token.symbol.toLowerCase() == "GBPx".toString().toLowerCase(),
      );

      Token PPLToken = store.state.cashWalletState.tokens.values.firstWhere(
        (token) => token.symbol.toLowerCase() == "PPL".toString().toLowerCase(),
      );

      //If Selected GBPx amount is not 0, transfer GBPx
      Map<String, dynamic> GBPxResponse = store.state.cartState.selectedGBPxAmount != 0.0
          ? double.parse(GBPxToken.getBalance().replaceAll(",", "")) > store.state.cartState.selectedGBPxAmount
              ? await walletApi.tokenTransfer(
                  getIt<Web3>(instanceName: 'fuseWeb3'),
                  store.state.userState.walletAddress,
                  GBPxToken.address,
                  store.state.cartState.restaurantWalletAddress, //TODO: change
                  store.state.cartState.selectedGBPxAmount.toString(),
                  externalId: store.state.cartState.paymentIntentID,
                )
              : {}
          : {};

      print(GBPxResponse);

      //If Selected PPL Amount is not 0, transfer PPL
      Map<String, dynamic> PPLResponse = store.state.cartState.selectedPPLAmount != 0.0
          ? double.parse(PPLToken.getBalance().replaceAll(",", "")) > store.state.cartState.selectedPPLAmount
              ? await walletApi.tokenTransfer(
                  getIt<Web3>(instanceName: 'fuseWeb3'),
                  store.state.userState.walletAddress,
                  PPLToken.address,
                  store.state.cartState.restaurantWalletAddress, //TODO: change
                  store.state.cartState.selectedPPLAmount.toString(),
                  externalId: store.state.cartState.paymentIntentID,
                )
              : {}
          : {};

      print(PPLResponse);

      if (GBPxResponse.isNotEmpty || PPLResponse.isNotEmpty) {
        Future.delayed(Duration(seconds: 2), () {
          store.dispatch(SetTransferringPayment(false));
          store.dispatch(SetConfirmed(true));
          successCallback();
        });
      }

      //Make periodic API calls to check the order status
      //If status is paid, then set loading = false, and confirmed = true

      // if (GBPxResponse.isNotEmpty || PPLResponse.isNotEmpty) {
      //   Timer.periodic(
      //     const Duration(seconds: 4),
      //     (timer) async {
      //       final Future<Map<dynamic, dynamic>> checkOrderResponse =
      //           peeplEatsService.checkOrderStatus(store.state.cartState.orderID);

      //       checkOrderResponse.then(
      //         (completedValue) {
      //           if (completedValue['paymentStatus'] == "paid") {
      //             store.dispatch(SetTransferringPayment(false));
      //             store.dispatch(SetConfirmed(true));
      //             successCallback();
      //             timer.cancel();
      //           }
      //         },
      //       );
      //     },
      //   );
      // }
    } catch (e, s) {
      store.dispatch(SetError(true));
      log.error('ERROR - sendTokenPayment $e');
      await Sentry.captureException(
        e,
        stackTrace: s,
        hint: 'ERROR - sendTokenPayment $e',
      );
    }
  };
}
